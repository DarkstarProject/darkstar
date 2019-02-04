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
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.MIJIN_GAKURE, hpp = math.random(20, 30)},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
