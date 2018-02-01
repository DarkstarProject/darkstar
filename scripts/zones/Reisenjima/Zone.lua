-----------------------------------
--
-- Zone: Reisenjima (291)
--
-----------------------------------
package.loaded["scripts/zones/Reisenjima/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Reisenjima/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-500.023,-19.074,-487.686,190);
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