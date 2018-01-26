-----------------------------------
--
-- Zone: Celennia Memorial Library (284)
--
-----------------------------------
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Celennia_Memorial_Library/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if ( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -96,-2,-87,94);
    end

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
end;