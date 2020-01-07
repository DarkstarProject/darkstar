-----------------------------------
-- Area: Jugner Forest
--  VNM: Krabkatoa
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.KRABKATOA_STEAMER)
end