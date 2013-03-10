-----------------------------------
--
-- Zone: Wajaom_Woodlands (51)
--
-----------------------------------

package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Wajaom_Woodlands/TextIDs");

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
		player:setPos(610.542,-28.547,356.247,122);
	elseif(player:getVar("threemenandaclosetCS") == 2 and prevZone == 50) then
		cs = 0x01fe;  
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
	if(csid == 0x01fe)then
	    player:setVar("threemenandaclosetCS",3);
	end
end;	
