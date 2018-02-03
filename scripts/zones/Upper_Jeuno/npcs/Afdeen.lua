-----------------------------------
-- Area: Upper Jeuno
--  NPC: Afdeen
-- Standard Merchant NPC
-- @zone 244
-- !pos 1.462 0.000 21.627
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(179);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 179 and option == 1) then
        player:setPos(0,0,0,0,44);
    end
end;

