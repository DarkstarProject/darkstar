#!/bin/bash
for line in `grep -e "Cl.*Include=\"\." win32/vcxproj/DSGame*proj | tr -d " \"\" \"\/\>\r" | cut -c25- | sed 's:\\\:\/:g' `; do echo -n "${line} \\"; echo; done > game.sources

echo SRC_COMMON = \\ > sources.am
cat game.sources | grep src/common/ | sed '$s/.$//' >> sources.am
echo "" >> sources.am

echo SRC_MAP = \\ >> sources.am
cat game.sources | grep src/map/ | sed '$s/.$//' >> sources.am
echo "" >> sources.am

for line in `grep -e "Cl.*Include=\"\." win32/vcxproj/DSConnect*proj | tr -d " \"\/\>\r" | cut -c25- | sed 's:\\\:\/:g' `; do echo -n "${line} \\"; echo; done > connect.sources

echo SRC_LOGIN = \\ >> sources.am
cat connect.sources | grep src/login/ | sed '$s/.$//' >> sources.am
echo "" >> sources.am

for line in `grep -e "Cl.*Include=\"\." win32/vcxproj/DSSearch*proj | tr -d " \"\/\>\r" | cut -c25- | sed 's:\\\:\/:g' `; do echo -n "${line} \\"; echo; done > search.sources

echo SRC_SEARCH_COMMON = \\ >> sources.am
cat search.sources | grep src/common/ | sed '$s/.$//' >> sources.am
echo "" >> sources.am

echo SRC_SEARCH = \\ >> sources.am
cat search.sources | grep src/search/ | sed '$s/.$//' >> sources.am
echo "" >> sources.am

echo "SRC_DARKSTAR = \$(SRC_COMMON)" >> sources.am

rm *.sources
