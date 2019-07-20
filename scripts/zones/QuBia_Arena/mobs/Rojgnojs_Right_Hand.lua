-----------------------------------
-- Area: QuBia_Arena
--  Mob: Rojgnoj's Right Hand
-- Mission 9-2 SANDO
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(dsp.mod.SLEEPRES,50);
end;

function onMobDeath(mob, player, isKiller)
end;
