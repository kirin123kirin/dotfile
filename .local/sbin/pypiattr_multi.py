#!/usr/bin/env python
import sys, re, os
from collections import defaultdict
try:
	from urllib2 import urlopen, urlretrieve
except ImportError:
    from urllib.request import urlopen, urlretrieve
from joblib import Parallel, delayed

PROC = 20
PIPURL = 'https://pypi.org'
SIMPLE = PIPURL + "/simple"
re_a = re.compile('\s*<a +href="?([^"]+)"?[^>]*>[^<>]+(\.[a-z0-9]+)?</a>.*')
re_c = re.compile('(?:\.(?:win|macosx|linux)?(?:zip|tar|gz|bz|tgz|tbz).*|\-(?:cp|py).+\.whl|(?:\-py.+)?\.egg|[\.\-](?:win|macosx|linux).+\.(?:exe|dmg))(?:\r?\n)?')

def getlinks(html, name):
    r = defaultdict(list)
    cur = ""
    re_c = re.compile(name + "[\-_\.]?([0-9\.]+[0-9]).+")
    for hs in html.splitlines():
        ra = re_a.match(hs)
        if ra is None:
            continue
        link, ext = ra.groups()
        r[ext].append(link)
        ver =  re_c.sub('', link.split("#")[0].split("/")[-1])
        cur = ver if cur < ver else cur
    return dict(r), cur

def wgetcmd(html, name):
    r, cur = getlinks(html, name)
    for rv in r.values():
        yield rv.pop() + " -P " + name if name else rv.pop()
        for v in rv:
            if cur and cur in v:
                yield v + " -P " + name if name else v

def download(link, dirname):
    if not os.path.isdir(dirname):
        os.makedirs(dirname)
    urlretrieve(link, dirname + "/" + link.split("#")[0].split("/")[-1])

def wget(html, name):
    r, cur = getlinks(html, name)
    for rv in r.values():
        download(rv.pop(), name)
        for v in rv:
            if cur and cur in v:
                download(v, name)

def gethtml(url):
    html = urlopen(url).read()
    if isinstance(html, bytes):
        html = html.decode("utf-8")
    return html

def main(x):
    if "</a>" in x:
        href = re_a.match(x).group(1)
        data = gethtml(PIPURL + href)
        for y in wgetcmd(data, href.strip("/").replace("simple/", "")):
            if y:
                sys.stdout.write(y + "\n")
                sys.stdout.flush()

def test(x):
    if "</a>" in x:
        href = re_a.match(x).group(1)
        data = gethtml(PIPURL + href)
        return [y for y in wgetcmd(data, href.strip("/").replace("simple/", "")) if y]

if __name__ == "__main__":
    func = delayed(test)
    res = urlopen(SIMPLE)#.readlines()[:10]
    Parallel(n_jobs=-1, verbose=1, backend="threading")([func(x.decode().strip() if isinstance(x, bytes) else x.strip()) for x in res])

