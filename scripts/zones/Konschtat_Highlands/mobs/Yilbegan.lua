-----------------------------------
-- Area: Konschtat Highlands
--  VNM: Yilbegan
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.YILBEGAN_HIDEFLAYER)
    if player:getCharVar("TutorialProgress") == 7 then
        player:setCharVar("TutorialProgress", 8)
    end
end