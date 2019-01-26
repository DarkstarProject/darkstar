-----------------------------------
-- Area: La Theine Plateau
--  MOB: Bloodtear_Baldurf
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(dsp.mobMod.MULTI_2HOUR, 1) -- not currently implemented
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.THE_HORNSPLITTER)
end