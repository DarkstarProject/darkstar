-----------------------------------
-- Area: The Boyahda Tree
--   NM: Voluptuous Vivian
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 2)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.THE_VIVISECTOR)
end
