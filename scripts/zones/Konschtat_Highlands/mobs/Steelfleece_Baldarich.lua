-----------------------------------
-- Area: Konschtat Highlands
--   NM: Steelfleece Baldarich
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.MIGHTY_STRIKES, hpp = math.random(90, 95), cooldown = 120} -- "Uses ... Mighty Strikes, which can be used multiple times."
        }
    })
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.THE_HORNSPLITTER)
end
