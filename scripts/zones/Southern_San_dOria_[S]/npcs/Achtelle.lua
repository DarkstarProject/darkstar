-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Achtelle
-- @zone 80
-- !pos 108 2 -11
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
--player:startEvent(510);  Event doesnt work but this is her default dialogue, threw in something below til it gets fixed

    player:showText(npc, 13454); -- (Couldn't find default dialogue)  How very good to see you again!
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;