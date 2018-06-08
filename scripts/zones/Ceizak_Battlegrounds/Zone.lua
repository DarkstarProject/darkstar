-----------------------------------
--
-- Zone: Ceizak Battlegrounds
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Ceizak_Battlegrounds/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ceizak_Battlegrounds/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
player:setPos(431,0,178,110);
end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

