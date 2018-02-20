-----------------------------------
--
-- Zone: Silver_Sea_route_to_Nashmau
--
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    return cs;
end;

function onTransportEvent(player,transport)
    player:startEvent(1025);
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
    if (csid == 1025) then
        player:setPos(0,0,0,0,53);
    end
end;

