-----------------------------------
-- Area: Dynamis Beaucedine
--  MOB: Vanguard_Ambusher
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_GOBLIN)
end

function onMobDeath(mob, player, isKiller)
end