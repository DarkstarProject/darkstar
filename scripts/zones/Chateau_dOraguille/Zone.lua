-----------------------------------
--
-- Zone: Chateau_dOraguille
--
-----------------------------------

package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;

-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Chateau_dOraguille/TextIDs");
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
		player:setPos(14.872,8.918,24.002,255);
	end	

	if(prevZone == 231 and player:getCurrentMission(SANDORIA) == THE_CRYSTAL_SPRING and player:getVar("MissionStatus") == 2) then	
		cs = 0x022b;
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

	if(csid == 0x022b) then	
		player:setVar("MissionStatus",3);
	end

end;	
