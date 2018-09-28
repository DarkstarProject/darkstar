-----------------------------------
-- Area: Dynamis Jeuno
--  MOB: Prowlox_Barrelbelly
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