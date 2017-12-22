#!/bin/bash
sh gensources.sh
autoheader
aclocal
autoconf
automake --add-missing
git rev-parse HEAD > GIT_VER