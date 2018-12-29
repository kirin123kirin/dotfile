#!/usr/bin/env python
import sys, re
from collections import defaultdict
try:
	from urllib2 import urlopen
except ImportError:
    from urllib.request import urlopen

vi = {"rc": -100, "beta": -200, "alpha": -300, "dev": -400}
rn = re.compile("\d+")
def num(s):
    if not s:
        return 0
    try:
        return int(s)
    except:
        sr = sum(map(int, rn.findall(s)))
        if s in vi:
            sr += vi[s]
        else:
            sr += (122 - ord(s[0])) * -100
        return sr

re_v = re.compile("\-([0-9]+)\.?([0-9]+)\.?([0-9]*)[\-\.]?([abrd][a-z0-9]*)*(?:.*[^0-9]([0-9]+))*")
rm = re.compile("[\-\.](((py|cp)[23])|win(32|64|16)|macosx|linux|tar|gz|zip|egg|exe).*")
def versions(s):
    rv = re_v.search(rm.sub('', s))
    if rv:
        return tuple(map(num, rv.groups()))
    return (0, 0, 0, 0, 0)

def getnewer(a, b, stable=True):
    if not isinstance(a, tuple):
        a = versions(a)
    if not isinstance(b, tuple):
        b = versions(b)
    r = a < b
    if stable is True and r and all(x >= 0 for x in a) and any(x < 0 for x in b):
        return a
    else:
        return b if r else a

re_a = re.compile('\s*<a +href="?([^"]+)"?[^>]*>([^<>]+(\.[a-z0-9]+)?)</a>.*')

def wgetcmd(html, name = None):
    links = [re_a.match(hs).groups() for hs in html.splitlines() if "</a>" in hs]
    if links:
        r = defaultdict(list)
        cur = (0, 0, 0, 0, 0)

        for link, pkg, ext in links:
            r[ext].append(link)
            cur = getnewer(cur, link.split("#")[0].split("/")[-1])

        for rv in r.values():
            yield rv.pop() + " -P " + name if name else rv.pop()
            for v in rv:
                if cur == versions(v):
                    yield v + " -P " + name if name else v

def main():
    x = " ".join(sys.argv[1:])
    if "</a>" in x:
        href, nm, _ = re_a.match(x).groups()
        html = urlopen('https://pypi.org' + href).read()
        if isinstance(html, bytes):
            html = html.decode()
        for w in wgetcmd(html, nm):
            sys.stdout.write(w + "\n")
            sys.stdout.flush()

if __name__ == "__main__":
    sys.argv.append("<a href=/simple/pandas/>pandas</a>")
    main()


