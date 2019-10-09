-----------------------------------
-- Area: QuBia_Arena
--  Mob: Warlord Rojgnoj
-- Mission 9-2 SANDO
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(dsp.mod.SLEEPRES,50);
end;

function onMobDeath(mob, player, isKiller)
end;
