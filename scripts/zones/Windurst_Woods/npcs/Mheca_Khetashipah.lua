-----------------------------------
-- Area: Windurst Woods
--  NPC: Mheca Khetashipah
-- Type: Standard NPC
-- !pos 66.881 -6.249 185.752 241
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(426);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
