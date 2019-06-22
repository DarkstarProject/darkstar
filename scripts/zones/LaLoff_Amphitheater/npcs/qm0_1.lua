-----------------------------------
-- Area: LaLoff_Amphitheater
--  NPC: qm0 (warp player outside after they win fight)
-------------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(12);
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
    if (csid == 12 and option == 1) then
        player:setPos(291.459,-42.088,-401.161,163,130);
    end
end;