-----------------------------------
-- Area: Quicksand Caves
--   NM: Centurio X-I
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1);
end;

function onMobSpawn(mob)
    mob:addMod(tpz.mod.SILENCERES, 35);
    mob:addMod(tpz.mod.SLEEPRES, 50);
    mob:addMod(tpz.mod.LULLABYRES, 50);
    mob:addMod(tpz.mod.SPELLINTERRUPT, 25);
end;

function onMobDeath(mob, player, isKiller)
end;
