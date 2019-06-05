#!/bin/bash
sh gensources.sh
autoheader
aclocal
autoconf
automake --add-missing