-----------------------------------
--
-- Zone: Eastern Adoulin
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Eastern_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Eastern_Adoulin/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
player:setPos(-155,0,-19,250);
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

