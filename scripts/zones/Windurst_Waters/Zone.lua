-----------------------------------
-- 
-- Zone: Windurst_Waters
-- 
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/server");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	-- Check if we are on Windurst Mission 1-3
	zone:registerRegion(1, 23,-11,-208, 24,-8,-207);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

	-- FIRST LOGIN (START CS)
	if (prevZone == 0) then
		if (OPENING_CUTSCENE_ENABLE == 1) then
			cs = 0x213;
		end
		CharCreate(player);
		player:setPos(-40,-5,80,64);
		player:setHomePoint();
	end

	-- MOG HOUSE EXIT
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		position = math.random(1,5) + 157;
		player:setPos(position,-5,-62,192);
			
		if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
			cs = 0x7534;
		end
		player:setVar("PlayerMainJob",0);
	end

return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
switch (region:GetRegionID()): caseof
{
	---------------------------------
	[1] = function (x)  -- Windurst Mission 1-3, final cutscene with Leepe-Hoppe
	---------------------------------
		-- If we're on Windurst Mission 1-3
		if(player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
			windurst_mission_1_3 = player:getVar("windurst_mission_1_3");
			if(windurst_mission_1_3 == 3) then
				player:startEvent(0x92);
			end
		end
	end,
	---------------------------------
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
	if(csid == 0x213) then
		player:messageSpecial(ITEM_OBTAINED,0x218);
	elseif (csid == 0x7534 and option == 0) then
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	elseif(csid == 0x92) -- Returned from Giddeus, Windurst 1-3
		player:setVar("windurst_mission_1_3",4);
	end
end;



