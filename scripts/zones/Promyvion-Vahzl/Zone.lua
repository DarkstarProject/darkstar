-----------------------------------
--
-- Zone: Promyvion-Vahzl (22)
--
-----------------------------------

package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/zones/Promyvion-Vahzl/TextIDs");

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
		player:setPos(7,-1,-106,14);
	end	
	
	if(player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==0)then
	cs= 0x0032;	
    elseif(ENABLE_COP_ZONE_CAP == 1)then
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);-- ZONE LEVEL RESTRICTION	
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
  if(csid ==0x0032)then
     player:setVar("PromathiaStatus",1);
    if(ENABLE_COP_ZONE_CAP == 1)then
	  player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);-- ZONE LEVEL RESTRICTION
    end
  end
end;	
