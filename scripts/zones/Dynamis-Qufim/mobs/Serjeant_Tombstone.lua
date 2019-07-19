-----------------------------------
-- Area: Dynamis-Qufim
--  Mob: Serjeant Tombstone
-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimOrcishList);
end;

function onMobDeath(mob, player, isKiller)
    --local mobID = mob:getID();
end;
