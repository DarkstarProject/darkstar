-----------------------------------
-- Area: Dynamis San d'Oria
--  MOB: Serjeant Tombstone
-- Map1 Position: http://www.dynamislounge.com/html/zone/frame_san1.htm
-- Map2 Position: http://www.dynamislounge.com/html/zone/frame_san2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

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
    dynamis.spawnGroup(mob, sandyList, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    mobID = mob:getID();
    -- Time Bonus (10min): 074
    if (mobID == 17535319 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        mob:addInBattlefieldList();
    -- Time Bonus (15min): 007
    elseif (mobID == 17535256 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    -- Time Bonus (15min): 009
    elseif (mobID == 17535258 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    -- Time Bonus (25min): 026
    elseif (mobID == 17535273 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(25);
        mob:addInBattlefieldList();
    -- Time Bonus (25min): 064
    elseif (mobID == 17535309 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(25);
        mob:addInBattlefieldList();
    -- Time Bonus (30min): 041
    elseif (mobID == 17535287 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- HP Bonus: 012 015 034 044 052 059 072 073 078 081 083 091 097 103 104 107 | 
    elseif (mobID == 17535261 or mobID == 17535264 or mobID == 17535281 or mobID == 17535290 or mobID == 17535298 or mobID == 17535305 or mobID == 17535317 or mobID == 17535318 or
           mobID == 17535323 or mobID == 17535326 or mobID == 17535328 or mobID == 17535336 or mobID == 17535340 or mobID == 17535344 or mobID == 17535345 or mobID == 17535348) then 
        player:restoreHP(2000);
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
    -- MP Bonus: 006 010 014 032 035 038 047 060 062 070 076 079 084 086 092 108 | 
    elseif (mobID == 17535255 or mobID == 17535259 or mobID == 17535263 or mobID == 17535279 or mobID == 17535282 or mobID == 17535284 or mobID == 17535293 or mobID == 17535306 or 
           mobID == 17535307 or mobID == 17535315 or mobID == 17535321 or mobID == 17535324 or mobID == 17535329 or mobID == 17535331 or mobID == 17535337 or mobID == 17535349) then 
        player:restoreMP(2000);
        player:messageBasic(025,(player:getMaxMP()-player:getMP()));
    -- Special
    elseif (mobID == 17535352) then
        SpawnMob(17535353); -- 112 spawn 113 when defeated
    elseif (mobID == 17535354) then
        SpawnMob(17535355); -- 114 spawn 115 when defeated
    end
    
end;
