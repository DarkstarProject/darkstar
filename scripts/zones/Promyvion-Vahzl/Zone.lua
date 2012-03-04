-----------------------------------
--
-- Zone: Promyvion-Vahzl
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
require("scripts/zones/Promyvion-Vahzl/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-140,-2.1,-56.893,192);
	end	
	-- ZONE LEVEL RESTRICTION	
	player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);	

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

function onEventUpdate(player,csid,menuchoice)	
	--print("CSID: ",csid);
	--print("RESULT: ",menuchoice);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,menuchoice)	
	--print("CSID: ",csid);
	--print("RESULT: ",menuchoice);
end;	
