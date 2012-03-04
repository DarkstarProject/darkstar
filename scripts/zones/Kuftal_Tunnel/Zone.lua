-----------------------------------
--
-- Zone: Kuftal_Tunnel
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
require("scripts/zones/Kuftal_Tunnel/TextIDs");

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
		player:setPos(20.37,-21.104,275.782,46);
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
