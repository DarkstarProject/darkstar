----------------------------------
-- Area: Quicksand Caves
--  NM:  Centurio X-I
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ALWAYS_AGGRO, 1);
end;

function onMobSpawn(mob)
    mob:addMod(MOD_SILENCERES, 35);
    mob:addMod(MOD_SLEEPRES, 50);
    mob:addMod(MOD_LULLABYRES, 50);
    mob:addMod(MOD_SPELLINTERRUPT, 25);
end;

function onMobDeath(mob, player, isKiller)
end;
