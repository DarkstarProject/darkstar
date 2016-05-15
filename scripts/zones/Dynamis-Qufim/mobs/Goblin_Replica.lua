-----------------------------------
-- Area: Dynamis qufim
--  MOB: Goblin Replica

-----------------------------------
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Qufim/TextIDs");

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
    dynamis.spawnGroup(mob, QufimGoblinList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    local mobID = mob:getID();
    

    if ( mobID == 16945528 or mobID == 16945538 or mobID == 16945546 ) then --hp
        player:messageBasic(024,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
     elseif (mobID == 16945529 or mobID == 16945545) then --mp
        player:messageBasic(025,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);        
    end
end;
