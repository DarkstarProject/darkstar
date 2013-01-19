-----------------------------------
--
-- Zone: Sacrarium (28)
--
-----------------------------------

package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/zones/Sacrarium/TextIDs");

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
		player:setPos(-219.996,-18.587,82.795,64);
	end	
	-- ZONE LEVEL RESTRICTION
	if(ENABLE_COP_ZONE_CAP == 1)then
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);	
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
