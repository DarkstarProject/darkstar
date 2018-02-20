-----------------------------------
--
-- Zone: Feretory
--
-----------------------------------
package.loaded["scripts/zones/Marjami_Ravine/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Marjami_Ravine/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    player:setPos(-358.000, -3.400, -440.00, 63);

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