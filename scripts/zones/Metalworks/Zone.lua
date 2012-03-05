-----------------------------------
--
-- Zone: Metalworks (237)
--
-----------------------------------

package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/server");
require("scripts/globals/settings");
require("scripts/zones/Metalworks/TextIDs");

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
		player:setPos(-9.168,-1.595,0.001,128);
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
