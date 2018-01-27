-----------------------------------
-- Area: Bostaunieux Obliette
--  NPC: _4n2 (Sewer Lid)
-- !pos -19.000 -17.899 20.000 167
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(SEEMS_LOCKED);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;