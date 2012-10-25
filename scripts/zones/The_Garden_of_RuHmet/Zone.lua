-----------------------------------
--
-- Zone: The_Garden_of_RuHmet (35)
--
-----------------------------------

package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1, -421, -2, 377,  -417, 0, 381); -- RDC
	zone:registerRegion(2, -422, -2, -422,  -418, 0, -418); -- +1
	zone:registerRegion(3, 418, -2, 378,  422, 0, 382); -- +2
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-351.136,-2.25,-380,253);
	end	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
	
	switch (region:GetRegionID()): caseof
	{
		[1] = function (x) player:startEvent(0x0065); end,
		[2] = function (x) player:startEvent(0x0066); end,
		[3] = function (x) player:startEvent(0x0067); end,
	}
	
end;	

-----------------------------------	
-- onRegionLeave	
-----------------------------------	

function onRegionLeave(player,region)	
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
	
	if(csid == 0x0065 and option == 1) then
		player:setPos(540,-1,-499.900,62,0x24);
	end
	
end;