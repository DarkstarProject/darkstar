-----------------------------------
-- Area: Dynamis
--  NPC: Somnial Threshold
-------------------------------------

function onTrigger(player,npc)

    player:startEvent(101, 0, 0, 5);

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 101 and option == 1) then
        player:setPos(119,-9,131,52,103);
    end

end;