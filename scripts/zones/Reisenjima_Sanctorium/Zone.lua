-----------------------------------
--
-- Zone: Reisenjima Sanctorium (293)
--
-----------------------------------
package.loaded["scripts/zones/Reisenjima_Sanctorium/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Reisenjima_Sanctorium/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(0.002,3.999,-9.876,190);
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
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