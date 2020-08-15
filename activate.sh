export                      MAGIC_87632519=$(dirname $0);
bh0-gitstat.root () {echo ${MAGIC_87632519} ; }

bh0-gitstat.thisdir () {
    dst=${1-.}
    [[ -d ${dst}/.git ]] || {
        echo >&2 "bh0-gitstat.thisdir: not the root of a git directory: [$dst]" ;
        return 1
    }
    pushd ${dst} > /dev/null
    echo $(python $(bh0-gitstat.root)/vendor/github/olivierverdier/zsh-git-prompt/gitstatus.py) ;
    popd > /dev/null
    return 0
}

bh0-gitstat () {
    for line in $( find . -maxdepth 3 -type d -name .git -print ) ; do
        line=$(dirname $line)
        echo $(bh0-gitstat.thisdir $line) "    " $line | python $(bh0-gitstat.root)/fixline.py
    done
}
