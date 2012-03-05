-----------------------------------
--
-- Zone: Mhaura (249)
--
-----------------------------------

package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(0.003,-6.252,117.971,65);
	end	
	return cs;	
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
end;	
