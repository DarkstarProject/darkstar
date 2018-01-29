-----------------------------------
-- Area: Caedarva Mire
-- Door: Heavy Iron Gate
-- !pos 540 -18 -441 79
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getZPos() <= -437) then
        player:startEvent(121);
    else
        player:startEvent(120);
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
