-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Feeler Antlion
-----------------------------------
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 40); -- Don't know exact value
    mob:addMod(MOD_REGEN, 30);
end;

function onMobSpawn(mob)
    mob:setLocalVar("SAND_BLAST",1);
end;

function onMobDeath(mob, player, isKiller)
end;
