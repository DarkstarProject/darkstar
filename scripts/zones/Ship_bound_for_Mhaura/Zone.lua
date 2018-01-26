-----------------------------------
--
-- Zone: Ship_bound_for_Mhaura (221)
--
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Ship_bound_for_Mhaura/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        local position = math.random(-2,2) + 0.150;
        player:setPos(position,-2.100,3.250,64);
    end
    return cs;
end;

function onTransportEvent(player,transport)
    player:startEvent(512);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 512) then
        player:setPos(0,0,0,0,249);
    end
end;