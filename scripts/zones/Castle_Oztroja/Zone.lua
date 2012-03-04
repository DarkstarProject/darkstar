-----------------------------------
--
-- Zone: Castle_Oztroja
--
-----------------------------------

package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;

-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Castle_Oztroja/TextIDs");
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
		player:setPos(-162.895,22.136,-139.923,2);
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
