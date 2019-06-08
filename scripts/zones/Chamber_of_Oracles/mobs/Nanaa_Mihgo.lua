-----------------------------------
-- Area: Chamber of Oracles
-- MOB: Nanaa Mihgo
-- AMK 10 BCNM
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
    specials =
        {
            {
                --id = dsp.jsa.PERFECT_DODGE
            },
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
