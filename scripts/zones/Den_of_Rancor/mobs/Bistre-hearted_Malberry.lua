-----------------------------------
-- Area: Den of Rancor
--   NM: Bistre-hearted Malberry
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MANAFONT, hpp = math.random(40, 95)},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
