-----------------------------------
--
-- Zone: Spire_of_Mea (21)
--
-----------------------------------
package.loaded["scripts/zones/Spire_of_Mea/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Spire_of_Mea/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-1.539,-2.049,293.640,64); -- {R}
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
