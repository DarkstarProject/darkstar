-----------------------------------
--
-- Zone: Tavnazian_Safehold (26)
--
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Tavnazian_Safehold/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1, -5, -24, 18, 5, -20, 27);
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
cs = -1;	
	
	if(player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then	
		player:setPos(27.971,-14.068,43.735,66);
	end	
	
	if(player:getCurrentMission(COP) == AN_INVITATION_WEST)then
		cs = 0x0065;
	elseif(player:getCurrentMission(COP) == THE_CRADLES_OF_CHILDREN_LOST)then
        cs = 0x006B;	
	end
	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)
	
	switch (region:GetRegionID()): caseof
	{
		[1] = function (x)
			if(player:getCurrentMission(COP) == AN_ETERNAL_MELODY and player:getVar("PromathiaStatus") == 2) then
				player:startEvent(0x0069);
			end
		end,
	}
	
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
	
	if(csid == 0x0065) then
		player:completeMission(COP,AN_INVITATION_WEST);
		player:addMission(COP,THE_LOST_CITY);
	elseif(csid == 0x0069) then
		player:setVar("PromathiaStatus",0);
		player:completeMission(COP,AN_ETERNAL_MELODY);
		player:addMission(COP,ANCIENT_VOWS);
	elseif(csid == 0x006B) then
	 	player:completeMission(COP,THE_CRADLES_OF_CHILDREN_LOST);
		player:addMission(COP,SHELTERING_DOUBT);   
	end
	
end;