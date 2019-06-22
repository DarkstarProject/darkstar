-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Qn'aern
-- Note: The RNG versions in Garden assist Ix'Aern (DRK)
--       All Qn'aerns can use their respective two-hour abilities multiple times (guessing 2-minute timers)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.EES_AERN, hpp = math.random(90, 95), cooldown = 120}
        }
    })
end

function onMobDeath(mob, player, isKiller)
end
