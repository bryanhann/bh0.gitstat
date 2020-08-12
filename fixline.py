import sys

def _red(txt):
    RED="\x1b[1;31m"
    NORMAL="\x1b[0m"
    return RED + txt + NORMAL

parts = sys.stdin.readline().strip().split()
branch = parts.pop(0).ljust(10)
path   = parts.pop(-1)
flags  = ' '.join(parts)
clean = (flags == '0 0 0 0 0 0')

line="%s %s %s" % ( flags, branch, path )

if clean:
    print(line)
else:
    print(_red(line))
