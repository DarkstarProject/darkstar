-----------------------------------
-- Area: Windurst Woods
--  NPC: Palyalya
-- Type: Adv. Assistant
-- !pos 62.298 -3.499 -128.093 241
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10021);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
