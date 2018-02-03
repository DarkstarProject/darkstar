-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Houilloume
-- @zone 80
-- !pos
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(103); -- it says player:startEvent(103)
    -- the player:startEvent basically means start CutScene
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;