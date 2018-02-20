-----------------------------------
--
-- Zone: Provenance (222)
--
-----------------------------------
package.loaded["scripts/zones/Provenance/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Provenance/TextIDs");
-----------------------------------

function onInitialize(zone)

end;

function onZoneIn( player, prevZone)

cs = -1;
if ( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
player:setPos(-640,-20,-519.999,192);
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
