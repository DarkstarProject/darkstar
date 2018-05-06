-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Salamander
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
end;

function onMobDeath(mob, player, isKiller)
end;
