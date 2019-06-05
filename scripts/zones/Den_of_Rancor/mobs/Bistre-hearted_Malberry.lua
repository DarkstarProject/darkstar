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
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.MANAFONT, hpp = math.random(40, 95)},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
