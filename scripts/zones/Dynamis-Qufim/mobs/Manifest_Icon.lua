-----------------------------------
-- Area: Dynamis-Qufim
-- NPC:  Manifest_Icon
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
    dynamis.spawnGroup(mob, QufimYagudoList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    --local mobID = mob:getID();
    


    
    
end;
