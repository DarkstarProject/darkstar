-----------------------------------
-- Area: Upper Jeuno
--  NPC: Wise Wolf
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



