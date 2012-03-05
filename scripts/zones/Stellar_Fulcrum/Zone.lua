-----------------------------------
-- 
-- Zone: Stellar_Fulcrum
-- 
-----------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Stellar_Fulcrum/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	
	zone:registerRegion(1, -522, -2, -49,  -517, -1, -43); -- To Upper Delkfutt's Tower
	
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
	
	if(region:GetRegionID() == 1) then
		player:startEvent(8);
	end
	
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
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
	
	if(csid == 8 and option == 1) then
		player:setPos(-370, -178, -40, 243, 0x9e);
	end
	
end;