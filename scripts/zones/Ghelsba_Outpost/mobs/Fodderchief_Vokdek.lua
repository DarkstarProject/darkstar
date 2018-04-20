-----------------------------------
-- Area: Ghelsba Outpost
--   NM: Fodderchief Vokdek
-- Involved in Mission: Save the Children
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_GIL_MAX, -1);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;