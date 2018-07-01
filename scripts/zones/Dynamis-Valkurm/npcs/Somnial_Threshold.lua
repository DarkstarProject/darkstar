-----------------------------------
-- Area: Dynamis
--  NPC: Somnial Threshold
-------------------------------------

function onTrigger(player,npc)

    player:startEvent(101, 0x27, 1, 7);

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if csid == 101 and option == 1 then
        player:setPos(119,-9,131,52,0x67);
    elseif csid == 101 and option == 2 then
        player:delStatusEffectSilent(dsp.effect.SJ_RESTRICTION)
    end

end;
