-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Halaviabeau
-- Quest NPC
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    player:startEvent(611);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;
