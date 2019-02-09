-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Yarr the Pearleyed
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.BENEDICTION, hpp = math.random(1, 50)} -- "Uses Benediction at around 50% or as low as 1%"
        }
    })
end

function onMobDeath(mob, player, isKiller)
end
