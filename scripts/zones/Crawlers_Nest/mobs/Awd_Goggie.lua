-----------------------------------
-- Area: Crawler's Nest
--  MOB: Awd Goggie
-- !pos -253.026 -1.867 253.055 197
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BOGEYDOWNER)
end