#!/bin/sh

set -e -x

repo_name="babashka-deps"
while getopts "u:r:" opt; do
    case $opt in
        u)
            repo_user="$OPTARG";;
        r)
            repo_name="$OPTARG";;
    esac
done

here="`pwd`"
tmp="$here/.babashka/tmp"
tmp_tarball="$tmp/babashka.tar.gz"
install_dir="$HOME/.babashka/src"

echo "Making workdir for babashka"
mkdir -p .babashka/tmp

download_tarball() {
    if which curl > /dev/null; then
        curl -vL https://github.com/"$1"/archive/master.tar.gz -o "$2"
    elif which wget > /dev/null; then
        echo "You've got wget, but it seems to have issues with github downloads. Install curl and try again"
        exit 1
    else
        echo "Couldn't find anything to download with" >&2
        exit 1
    fi
}

if [ -f "$tmp_tarball" ]; then
    echo "Babashka tarball already fetched"
else
    echo "Fetching babashka tarball"
    download_tarball "richo/babashka" "$tmp_tarball"
fi

echo "Setting up babashka in $HOME"
mkdir -p "$install_dir"
tar -xzf "$tmp_tarball" --strip-components 1 -C "$install_dir"

echo "You will probably want to cleanup $here/.babashka/tmp"
echo "You will also likely want to add $install_dir/src/bin to your PATH"

[ -z "$repo_user" ] && exit 0
echo "You specified a repo- setting it up in $HOME/.babashka/deps"

deps_dir="$HOME/.babashka/deps"
deps_tmp="$HOME/.babashka/tmp/deps.tar.gz"
if which git >/dev/null; then
    git clone "git://github.com/${repo_user}/${repo_name}.git" "$deps_dir"
else
    download_tarball "${repo_user}/${repo_name}" "$deps_tmp"
    tar -xzf "$deps_tmp" --strip-components 1 -C "$deps_dir"
fi
