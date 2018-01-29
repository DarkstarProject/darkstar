-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Alfred
-- @zone 80
-- !pos 94 1 -58
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(314);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 200 and option == 1) then
        player:setPos(94,-62,266,40,81);
    end

end;