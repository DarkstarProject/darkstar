-----------------------------------
-- Area: Konschtat Highlands
--   NM: Stray Mary
-----------------------------------
require("scripts/globals/titles")
require("scripts/quests/tutorial")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.MARYS_GUIDE)
    tpz.tutorial.onMobDeath(player)
end
