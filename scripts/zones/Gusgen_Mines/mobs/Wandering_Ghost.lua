-----------------------------------
-- Area: Gusgen Mines
--   NM: Wandering Ghost
-- Involved In Quest: Ghosts of the Past
-- !pos -174 0.1 369 196
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 300);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;
