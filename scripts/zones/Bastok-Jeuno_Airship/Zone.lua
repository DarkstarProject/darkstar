-----------------------------------
--
-- Zone: Bastok-Jeuno_Airship
--
-----------------------------------

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) or (player:getYPos() == 0) or (player:getZPos() == 0)) then
        player:setPos(math.random(-4, 4),1,math.random(-23,-12));
    end

    return cs;
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    player:startEvent(0x0064);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0064) then
        local prevzone = player:getPreviousZone();
        if (prevzone == 246) then
            player:setPos(0,0,0,0,236);
        elseif (prevzone == 236) then
            player:setPos(0,0,0,0,246);
        end
    end
end;