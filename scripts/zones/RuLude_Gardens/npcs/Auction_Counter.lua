-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Auction Counter
-- Working 100%
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:sendMenu(3);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
