-----------------------------------
--
-- Zone: Lebros_Cavern
--
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Lebros_Cavern/IDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    local pos = player:getPos();

    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        player:setPos(player:getInstance():getEntryPos());
    end

    player:addTempItem(5345);

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 102) then
        player:setPos(0,0,0,0,61);
    end
end;

function onInstanceLoadFailed()
    return 61;
end;