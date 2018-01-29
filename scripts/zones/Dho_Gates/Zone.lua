-----------------------------------
--
-- Zone: Foret de Hennetiel
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Dho_Gates/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dho_Gates/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
player:setPos(62,-10,83,84);
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

