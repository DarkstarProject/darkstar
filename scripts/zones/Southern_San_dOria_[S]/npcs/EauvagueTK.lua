-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Eauvague T.K
-- @zone 80
-- !pos 105 0 -53
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(200);
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