-----------------------------------
--
-- Zone: Kazham-Jeuno_Airship
--
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0) then
        player:setPos(math.random(-4, 4),1,math.random(-23,-12));
    end

    return cs;
end;

function onTransportEvent(player,transport)
    player:startEvent(10);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10) then
        local prevzone = player:getPreviousZone();
        if (prevzone == 250) then
            player:setPos(0,0,0,0,246);
        elseif (prevzone == 246) then
            player:setPos(0,0,0,0,250);
        end
    end
end;