#!/bin/sh

git clone git://github.com/richo/babashka.git _repo
mv _repo/.git ./
rm -rf _repo
