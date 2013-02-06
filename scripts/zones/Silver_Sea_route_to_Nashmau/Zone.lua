-----------------------------------
-- 
-- Zone: Silver_Sea_route_to_Nashmau
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs"] = nil;
require("scripts/zones/Silver_Sea_route_to_Nashmau/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

return cs;
end;
-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
	player:startEvent(0x0401);
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
  if(csid == 0x0401) then
    player:setPos(0,0,0,0,53);
  end
end;



