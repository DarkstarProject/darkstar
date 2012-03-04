-----------------------------------
--
-- Zone: QuBia_Arena
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
require("scripts/zones/QuBia_Arena/TextIDs");

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
		player:setPos(-241.046,-25.86,19.991,0);
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
