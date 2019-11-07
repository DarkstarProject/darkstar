-----------------------------------
-- Area: Temenos
--  Mob: Grognard Impaler
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.CALL_WYVERN, hpp = 100},
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
