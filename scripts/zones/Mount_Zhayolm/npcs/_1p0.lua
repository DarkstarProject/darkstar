-----------------------------------
-- Area: Mount Zhayolm
-- Door: Heavy Iron Gate
-- !pos 660 -27 328 61
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getZPos() < 332) then
        player:startEvent(106);
    else
        player:startEvent(107);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
