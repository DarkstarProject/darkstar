-----------------------------------
-- Area: Nashmau
--  NPC: Nabihwah
-- Type: Standard NPC
-- !pos 9.988 -7 68.585 53
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(253, npc);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
