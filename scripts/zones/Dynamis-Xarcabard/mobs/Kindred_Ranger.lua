-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Kindred_Ranger
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_KINDRED)
end

function onMobDeath(mob, player, isKiller)
end