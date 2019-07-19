-----------------------------------
-- Area: Horlais Peak
--  Mob: Dragonian Minstrel
-- KSNM30
-- TODO: Chaos Blade effect gets stronger after they use their respective 2-hour.
--       50% HP/MP reduction pre-2 hour and 75% HP/MP reduction post-2 hour.
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = dsp.jsa.SOUL_VOICE,
                endCode = function(mob)
                    mob:addMod(dsp.mod.ATT, 200)
                end,
            },
        },
    })
end

function onMobDeath(mob, player, isKiller)
end
