-----------------------------------
--
-- Zone: Outer_Horutoto_Ruins
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");

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
		player:setPos(419.991,-9.637,716.991,190);
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
