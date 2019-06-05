-----------------------------------
-- Area: Upper Delkfutt's Tower
--   NM: Mimas
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	dsp.mix.jobSpecial.config(mob, {
    specials =
    {
        {id = dsp.jsa.HUNDRED_FISTS},
    },
	})
end

function onMobDeath(mob, player, isKiller)
end
