-----------------------------------
-- Area: Dynamis Beaucedine
--  MOB: GuKhu_Dukesniper
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_QUADAV)
    mob:setLocalVar("dynamis_currency", 1455)
end

function onMobDeath(mob, player, isKiller)
end