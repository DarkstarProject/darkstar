-----------------------------------
-- Area: Western Adoulin
--  NPC: Fervent Horizon
-- Type: Standard NPC
--  @zone 256
-- !pos -8 0 -61
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard dialogue
    player:startEvent(517);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
