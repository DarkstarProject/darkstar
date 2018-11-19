-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Beryl-footed Molberry
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
    SetServerVariable("[POP]Beryl-footed_Molberry", os.time() + 900) -- 15 min
end
