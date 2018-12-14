-----------------------------------
-- Area: Zhayolm Remnants
--   NM: Battleclad Chariot
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.STAR_CHARIOTEER)
end