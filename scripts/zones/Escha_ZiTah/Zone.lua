-----------------------------------
--
-- Zone: Escha_ZiTah (288)
--
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Escha_ZiTah/TextIDs");

-----------------------------------
-- onInitialize
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
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
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
