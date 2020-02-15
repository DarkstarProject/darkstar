-----------------------------------
-- Area: Konschtat Highlands
--   NM: Stray Mary
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.MARYS_GUIDE)
	if (player:getCharVar("TutorialProgress") == 7) then
		player:setCharVar("TutorialProgress",8)
	end
end
