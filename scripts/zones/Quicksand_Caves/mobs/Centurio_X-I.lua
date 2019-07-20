-----------------------------------
-- Area: Quicksand Caves
--   NM: Centurio X-I
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1);
end;

function onMobSpawn(mob)
    mob:addMod(dsp.mod.SILENCERES, 35);
    mob:addMod(dsp.mod.SLEEPRES, 50);
    mob:addMod(dsp.mod.LULLABYRES, 50);
    mob:addMod(dsp.mod.SPELLINTERRUPT, 25);
end;

function onMobDeath(mob, player, isKiller)
end;
