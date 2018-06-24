-----------------------------------
--
-- Zone: Foret de Hennetiel
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Foret_de_Hennetiel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Foret_de_Hennetiel/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
player:setPos(360,6,455,93);
end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

