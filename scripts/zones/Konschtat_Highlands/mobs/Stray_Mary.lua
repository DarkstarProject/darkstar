-----------------------------------
-- Area: Konschtat Highlands
--   NM: Stray_Mary
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.MARYS_GUIDE)
end
