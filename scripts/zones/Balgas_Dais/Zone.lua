-----------------------------------
--
-- Zone: Balgas_Dais
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
require("scripts/zones/Balgas_Dais/TextIDs");

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
		player:setPos(317.842,-126.158,380.143,127);
	end	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------	

function onRegionEnter(player,region)	
	print("Player: ",player);
	print("RESULT: ",regionID);
end;	

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,menuchoice)	
	print("zone CSID: ",csid);
	print("zone RESULT: ",menuchoice);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,menuchoice)	
	--print("CSID: ",csid);
	--print("RESULT: ",menuchoice);
end;	
