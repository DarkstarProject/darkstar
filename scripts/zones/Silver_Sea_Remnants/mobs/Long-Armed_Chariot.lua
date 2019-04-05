-----------------------------------
-- Area: Silver Sea Remnants
--   NM: Long-Armed Chariot
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.MOON_CHARIOTEER)
end