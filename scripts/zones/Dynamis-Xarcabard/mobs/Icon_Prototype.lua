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

function onMobDeath(mob,killer,ally)
    
    local mobID = mob:getID();
    
    -- Time Bonus: 043
    if (mobID == 17330814 and mob:isInBattlefieldList() == false) then
        ally:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- HP Bonus: 052
    elseif (mobID == 17330533) then
        ally:restoreHP(2000);
        ally:messageBasic(024,(ally:getMaxHP()-ally:getHP()));
    -- HP Bonus: 073
    elseif (mobID == 17330843) then
        ally:restoreMP(2000);
        ally:messageBasic(025,(ally:getMaxMP()-ally:getMP()));
    end
    
end;