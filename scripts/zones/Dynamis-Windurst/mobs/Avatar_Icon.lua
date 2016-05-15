-----------------------------------
-- Area: Dynamis Windurst
--  MOB: Avatar Icon
-- Map1 Position: http://images2.wikia.nocookie.net/__cb20090312004752/ffxi/images/8/84/Win1.jpg
-- Map2 Position: http://images2.wikia.nocookie.net/__cb20090312004839/ffxi/images/6/61/Win2.jpg
-----------------------------------
package.loaded["scripts/zones/Dynamis-Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Windurst/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, windyList, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    mobID = mob:getID();
    -- Time Bonus (20min): 008
    if (mobID == 17543494 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    -- Time Bonus (20min): 018
    elseif (mobID == 17543504 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    -- Time Bonus (10min): 031
    elseif (mobID == 17543514 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        mob:addInBattlefieldList();
    -- Time Bonus (20min): 041
    elseif (mobID == 17543518 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    -- Time Bonus (10min): 058
    elseif (mobID == 17543534 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        mob:addInBattlefieldList();
    -- Time Bonus (20min): 066
    elseif (mobID == 17543542 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    -- Time Bonus (20min): 101
    elseif (mobID == 17543577 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    -- HP Bonus: 006 012 019 024 029 035 042 051 056 074 083 088 094 095 100 110 117 | 126 133 136 138
    elseif (mobID == 17543492 or mobID == 17543498 or mobID == 17543505 or mobID == 17543508 or mobID == 17543512 or mobID == 17543517 or mobID == 17543393 or mobID == 17543527 or
           mobID == 17543532 or mobID == 17543550 or mobID == 17543559 or mobID == 17543564 or mobID == 17543570 or mobID == 17543571 or mobID == 17543576 or mobID == 17543586 or 
           mobID == 17543593 or mobID == 17543601 or mobID == 17543608 or mobID == 17543611 or mobID == 17543613) then 
        player:restoreHP(2000);
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
    -- MP Bonus: 008 017 025 030 032 040 045 057 060 072 077 080 086 096 111 118 | 127 131 137 139
    elseif (mobID == 17543494 or mobID == 17543503 or mobID == 17543305 or mobID == 17543513 or mobID == 17543515 or mobID == 17543392 or mobID == 17543521 or mobID == 17543533 or 
           mobID == 17543536 or mobID == 17543548 or mobID == 17543553 or mobID == 17543556 or mobID == 17543562 or mobID == 17543572 or mobID == 17543587 or mobID == 17543594 or
           mobID == 17543602 or mobID == 17543606 or mobID == 17543612 or mobID == 17543614) then 
        player:restoreMP(2000);
        player:messageBasic(025,(player:getMaxMP()-player:getMP()));
    end
    
end;
