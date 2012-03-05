-----------------------------------
--
-- Zone: Promyvion-Dem (18)
--
-----------------------------------

package.loaded["scripts/zones/Promyvion-Dem/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/zones/Promyvion-Dem/TextIDs");

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
		player:setPos(20,-2.1,63.031,192);
	end	
	-- ZONE LEVEL RESTRICTION	
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,30,0,0);	
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
