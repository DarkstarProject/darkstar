-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Gravestone
-- Involved in Quests: fire and brimstone (Rng AF2)
-- !zone 195
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getVar("fireAndBrimstone") == 3 then
        player:startEvent(5)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 5 then
        player:setVar("fireAndBrimstone", 4)
    end
end