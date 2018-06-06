-----------------------------------
-- Area: Dynamis Bastok
--  NPC: Vanguard Mason
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_QUADAV);
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;