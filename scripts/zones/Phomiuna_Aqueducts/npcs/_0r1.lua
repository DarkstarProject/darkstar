-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: _0r2 (Iron Gate)
-- !pos -140.000 -25.500 49.000 27
-----------------------------------
function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getAnimation() == 9) then
        npc:openDoor();
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