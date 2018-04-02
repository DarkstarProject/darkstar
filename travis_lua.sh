#!/bin/bash
sudo luarocks install luacheck
sudo luarocks install lanes

luacheck scripts -j 4
exit $?
