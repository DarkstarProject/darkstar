-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Feeler Antlion
-----------------------------------
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 40); -- Don't know exact value
    mob:addMod(dsp.mod.REGEN, 30);
end;

function onMobSpawn(mob)
    mob:setLocalVar("SAND_BLAST",1);
end;

function onMobDeath(mob, player, isKiller)
end;
