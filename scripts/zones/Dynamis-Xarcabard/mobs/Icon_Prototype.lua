-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Icon Prototype
-----------------------------------
package.loaded["scripts/zones/Dynamis-Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    local mobID = mob:getID();
    
    -- Time Bonus: 043
    if (mobID == 17330814 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- HP Bonus: 052
    elseif (mobID == 17330533) then
        player:restoreHP(2000);
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
    -- HP Bonus: 073
    elseif (mobID == 17330843) then
        player:restoreMP(2000);
        player:messageBasic(025,(player:getMaxMP()-player:getMP()));
    end
    
end;