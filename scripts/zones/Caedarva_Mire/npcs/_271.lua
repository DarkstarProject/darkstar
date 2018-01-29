-----------------------------------
-- Area: Caedarva Mire
-- Door: Heavy Iron Gate
-- !pos -299 -6 -80 79
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getZPos() < -78) then
        player:startEvent(122);
    else
        player:startEvent(123);
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
