-----------------------------------
-- Area: Den of Rancor
--   NM: Sozu Bliberry
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("useSpecAtHpMin", 40)
    mob:setLocalVar("useSpecAtHpMax", 95)
    mob:setLocalVar("useMainSpecAtHPP", math.random(40, 95))
end

function onMobDeath(mob, player, isKiller)
end
