-----------------------------------
-- 
-- Zone: Bastok_Markets
-- 
-----------------------------------

require("scripts/globals/server");
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

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

	-- FIRST LOGIN (START CS)
	if (prevZone == 0) then
		if (OPENING_CUTSCENE_ENABLE == 1) then
			--cs = 0x00;
		end
		CharCreate(player);
		player:setPos(-280,-12,-91,15);
		player:setHomePoint();
	end
	
	-- MOG HOUSE EXIT
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		position = math.random(1,5) - 33; 
		player:setPos(-177,-8,position,127);
		
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
	if(csid == 0x00) then
		player:messageSpecial(ITEM_OBTAINED,0x218);
	elseif (csid == 0x7534 and option == 0) then
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	end
end;



