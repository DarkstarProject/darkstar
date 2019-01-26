-----------------------------------
-- Area: Den of Rancor
--   NM: Celeste-eyed Tozberry
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("useSpecAtHpMin", 20)
    mob:setLocalVar("useSpecAtHpMax", 30)
    mob:setLocalVar("useMainSpecAtHPP", math.random(20, 30))
end

function onMobDeath(mob, player, isKiller)
end
