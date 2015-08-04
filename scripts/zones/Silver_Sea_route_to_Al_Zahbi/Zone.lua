-----------------------------------
-- 
-- Zone: Silver_Sea_route_to_Al_Zahbi
-- 
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs");
require("scripts/globals/settings");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
local cs = -1;

return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
	player:startEvent(0x0401);
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
	if (csid == 0x0401) then
		player:setPos(0,0,0,0,50);
	end
end;




