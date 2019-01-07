-----------------------------------
-- Area: Rolanberry Fields [S]
--  VNM: Verthandi
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VERTHANDI_ENSNARER)
end