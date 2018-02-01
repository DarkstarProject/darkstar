-----------------------------------
-- Area: Western Adoulin
--  NPC: Nargoht
-- Type: Standard NPC
--  @zone 256
--  !pos 25 0 117
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(557);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
