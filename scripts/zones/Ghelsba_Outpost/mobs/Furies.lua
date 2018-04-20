-----------------------------------
-- Area: Ghelsba outpost
--  MOB: Furies
-- BCNM20
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

function onMobDeath(mob, player, isKiller)
end;
