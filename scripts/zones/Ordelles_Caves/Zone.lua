-----------------------------------
--
-- Zone: Ordelles_Caves
--
-----------------------------------

package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;

-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Ordelles_Caves/TextIDs");
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
		player:setPos(-76.839,-1.696,659.969,122);
	end	

	if(prevZone == 102 and player:getVar("darkPuppetCS") == 1) then	
		cs = 0x000a;
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

	if(csid == 0x000a) then
		player:setVar("darkPuppetCS",2);
	end	

end;		
