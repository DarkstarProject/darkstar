-----------------------------------
-- Area: Jugner_Forest_[S]
--  VNM: Yilbegan
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.YILBEGAN_HIDEFLAYER)
end