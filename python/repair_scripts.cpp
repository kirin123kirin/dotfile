#include <chrono>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <filesystem>
#include <string>
#include <vector>
using cc = std::chrono::system_clock;
namespace fs = std::filesystem;

#include <Windows.h>

using ret_t = std::vector<std::string>;

const std::size_t BUFSIZE = 4096;

ret_t globber(const char* search_name,
              int mode = _S_IFIFO | _S_IFREG | _S_IREAD | _S_IWRITE | _S_IEXEC,
              bool recursive = true,
              int maxdepth = INT16_MAX,
              int _depth = 0) {
    char fn[BUFSIZE] = {0};
    char dirname[BUFSIZE] = {0};
    struct _stat sb;
    std::size_t slen = BUFSIZE;
    std::size_t dlen = BUFSIZE;
    std::size_t fclen = BUFSIZE;
    std::size_t fnlen = BUFSIZE;
    ret_t files = {};

    HANDLE hFind;
    WIN32_FIND_DATAA fd;

    if((hFind = FindFirstFileA(search_name, &fd)) == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Error: file not found %s\n", search_name);
        goto done;
    }

    if((slen = strnlen(search_name, BUFSIZE)) == BUFSIZE)
        goto done;

    for(dlen = slen - 1; dlen != 0; --dlen) {
        if(search_name[dlen] == '\\') {
            strncpy_s(dirname, BUFSIZE, search_name, ++dlen);
            break;
        } else if(search_name[dlen] == '/') {
            strncpy_s(dirname, BUFSIZE, search_name, dlen);
            dirname[dlen++] = '\\';
            break;
        }
    }
    if(dlen == 0) {
        dirname[0] = '.';
        dirname[1] = '\\';
        dlen = 2;
    }

    do {
        const char* fc = fd.cFileName;
        if(!fc || (fclen = strnlen(fc, BUFSIZE)) == BUFSIZE)
            continue;
        if(fc[0] == '.' && (fclen == 1 || (fclen == 2 && fc[1] == '.')))
            continue;
        strncpy_s(fn, BUFSIZE, dirname, dlen);
        strncpy_s(fn + dlen, BUFSIZE - dlen, fc, fclen);
        memset(fn + dlen + fclen, 0, (BUFSIZE - dlen - fclen) * sizeof(char));

        if(_stat(fn, &sb))
            continue;

        auto mask = sb.st_mode & _S_IFMT;

        if(mask & mode)
            files.emplace_back(fn);

        if(recursive && fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            fnlen = strnlen(fn, BUFSIZE);
            fn[fnlen] = '\\';
            fn[fnlen + 1] = '*';
            auto child_files = globber(fn, mode, recursive, maxdepth, ++_depth);
            files.insert(files.end(), child_files.begin(), child_files.end());
        }
    } while(FindNextFileA(hFind, &fd));

done:
    FindClose(hFind);
    return files;
}

int repair(const std::string& fname) {
    FILE *fp, *wfp;
    std::string outname = fname + ".tmp";

    fs::path p = fs::absolute(fname);
    if(!fs::exists(p)) {
        fprintf(stderr, "Error: File Not Found %s\n", p.string().c_str());
        return 1;
    }

    size_t r;
    std::string pp = p.parent_path().parent_path().string();
    if(!fs::exists(pp + "\\python.exe")) {
        char env[BUFSIZE] = {0};
        if(getenv_s(&r, env, BUFSIZE, "PYTHONPATH") || r == 0 || !fs::exists(std::string(env) + "\\python.exe")) {
            fprintf(stderr, "Warn: Skipped. Could not find python.exe.Expected Place is %s\\python.exe. but does not exist.\n", pp.c_str());
            return 0;
        }
        pp = env;
    }

    if(fopen_s(&fp, fname.c_str(), "rb")) {
        fprintf(stderr, "Error: %s %s\n", "Could Not Open file is ", fname.c_str());
        return 1;
    }

    std::uintmax_t size = fs::file_size(fname);
    std::string buf;
    std::size_t found_first, found_end;

    buf.resize(size + 1);
    fread(&buf.data()[0], 1, size, fp);
    fclose(fp);
    if(buf.find(pp + "\\python.exe\x0a") == std::string::npos) {
        if((found_first = buf.rfind("#!")) != std::string::npos) {
            found_first += 2;
            if((found_end = buf.rfind("\\python.exe\x0a")) != std::string::npos) {
                buf.replace(found_first, found_end - found_first, pp);
                if(fopen_s(&wfp, outname.c_str(), "wb")) {
                    fprintf(stderr, "Error: %s %s\n", "Could Not Open file is ", outname.c_str());
                    return 1;
                }
                fwrite(buf.c_str(), 1, buf.size() - 1, wfp);
                fclose(wfp);
                fs::remove(fname);
                fs::rename(outname, fname);
                printf("Repaired %s\n", fname.c_str());
                return 0;
            }
        }
    }
    fprintf(stderr, "Skipped. no need to do anything (%s)\n", fname.c_str());
    return 0;
}

int main(int argc, char* argv[]) {
    if(argc == 1) {
        fprintf(stderr, "Not Found file pathes.\n Expected at least 1 Argument or more.\n");
        return 1;
    }
    auto sa = cc::now();

    for(int i = 1; i < argc; ++i) {
        for(auto x : globber(argv[i])) {
            if(repair(x))
                return 1;
        }
    }

    auto ea = std::chrono::duration_cast<std::chrono::microseconds>(cc::now() - sa);
    printf("Done (runtime : %lld microseconds)\n", ea.count());
    return 0;
}
