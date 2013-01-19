-----------------------------------
--
-- Zone: PsoXja (9)
--
-----------------------------------

package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/PsoXja/TextIDs");

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
		player:setPos(-29.956,-1.903,212.521,188);
	end
	if(ENABLE_COP_ZONE_CAP == 1)then
         local LVLcap = player:getVar("PSOXJA_RESTRICTION_LVL");
	       if (LVLcap > 0)then
             player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,LVLcap,0,0);-- ZONE LEVEL RESTRICTION
           end
     end
	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
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
end;	
