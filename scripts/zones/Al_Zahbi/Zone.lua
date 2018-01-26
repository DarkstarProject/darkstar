-----------------------------------
--
-- Zone: Al_Zahbi (48)
--
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Al_Zahbi/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        position = math.random(1,5) + 37;
        player:setPos(position,0,-62,192);
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
