-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: Manifest_Icon
-----------------------------------
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Qufim/TextIDs");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimYagudoList);
end;

function onMobDeath(mob, player, isKiller)
    --local mobID = mob:getID();
end;
