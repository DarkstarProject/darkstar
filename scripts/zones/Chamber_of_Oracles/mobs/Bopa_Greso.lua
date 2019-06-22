-----------------------------------
-- Area: Chamber of Oracles
-- MOB: Bopa Greso
-- AMK 10 BCNM
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Chamber_of_Oracles/IDs")
-----------------------------------

function onMobSpawn(mob)
    mob:messageText(mob, ID.text.BOPAS_GONNA_USE_YOU_AS_A)
    mob:setTP(1000)
    dsp.mix.jobSpecial.config(mob, {
    specials =
        {
            {
                -- Has PD, even though she's a BLM
                id = dsp.jsa.PERFECT_DODGE,
                begCode = function(mob)
                    mob:messageText(mob, ID.text.HEY_BOSS_CHECK_THIS_OUT)
                end,
            },
        },
    })
end

function onMobWeaponSkill(target, mob, skill)
    mob:messageText(mob, ID.text.SIT_STILL_WILL_YA + math.random(0,4))
    
end

function onMobDeath(mob, player, isKiller)
end
