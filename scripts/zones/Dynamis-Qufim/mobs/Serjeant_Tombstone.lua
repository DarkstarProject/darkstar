-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: Serjeant_Tombstone
-----------------------------------
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dynamis-Qufim/TextIDs");
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimOrcishList);
end;

function onMobDeath(mob, player, isKiller)
    --local mobID = mob:getID();
end;
