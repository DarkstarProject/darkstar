-----------------------------------
--
-- Zone: Residential_Area
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Residential_Area/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Residential_Area/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    player:setVar("PlayerMainJob",player:getMainJob());
    player:eraseStatusEffect(true);
    player:setPos(0,0,0,192);

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

