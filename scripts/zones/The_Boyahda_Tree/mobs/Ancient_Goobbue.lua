-----------------------------------
-- Area: The Boyahda Tree
--   NM: Ancient Goobbue
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.CRITHITRATE, 25)
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.HUNDRED_FISTS, cooldown = 60, hpp = math.random(85, 95)},
        },
    })
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
