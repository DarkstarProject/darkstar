-----------------------------------
--
-- Zone: Norg (252)
--
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Norg/TextIDs");

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
	
	if((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-19.238,-2.163,-63.964,187);
	elseif(player:getCurrentMission(ZILART) == THE_NEW_FRONTIER) then
		cs = 0x0001;
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
	
	if(csid == 0x0001) then
		player:addKeyItem(MAP_OF_NORG);
		player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_NORG);
		player:completeMission(ZILART,THE_NEW_FRONTIER);
		player:addMission(ZILART,WELCOME_TNORG);
	end
	
end;	