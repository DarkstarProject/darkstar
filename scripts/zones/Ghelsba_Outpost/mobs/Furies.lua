-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Furies
-- BCNM20
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1);
end;

function onMobDeath(mob, player, isKiller)
end;
