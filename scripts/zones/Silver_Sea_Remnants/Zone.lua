-----------------------------------
--
-- Zone: Silver_Sea_Remnants
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Silver_Sea_Remnants/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Silver_Sea_Remnants/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

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

