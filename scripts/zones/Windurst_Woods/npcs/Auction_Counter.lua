-----------------------------------
-- Area: Windurst Woods
--  NPC: Auction Counter
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCharVar("TutorialProgress") == 4 then
        player:setCharVar("TutorialProgress", 5)
    end
    player:sendMenu(3)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
