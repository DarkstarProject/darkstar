-----------------------------------
--
-- Zone: Oldton_Movalpolos (11)
--
-----------------------------------

package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/Oldton_Movalpolos/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)	
  local LouverancePath=player:getVar("COP_Louverance_s_Path");	
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(70.956,5.99,139.843,134);
	end	
	if(player:getCurrentMission(COP) == THREE_PATHS and (LouverancePath == 3 or LouverancePath == 4))then
	    cs=1;
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
	if(csid==0x0001)then
	   player:setVar("COP_Louverance_s_Path",5);
	end
end;	
