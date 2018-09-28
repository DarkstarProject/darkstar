-----------------------------------
-- Area: Western Adoulin
--  NPC: Behff Oibbah
-- Type: Standard NPC
--  @zone 256
-- !pos 81 0 -17
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(514);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
