#!/bin/bash
luarocks install luacheck --local
luarocks install lanes --local

luacheck scripts -j 4
exit $?
