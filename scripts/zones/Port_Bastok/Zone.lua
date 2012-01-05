-----------------------------------
-- 
-- Zone: Port_Bastok
-- 
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/server");
require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");

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
			cs = 0x0001;
		end
		CharCreate(player);
		player:setPos(132,-8.5,-13,179);
		player:setHomePoint();
	end
	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		if (prevZone == 224) then
			cs = 0x0049;
			player:setPos(-36.000, 7.000, -58.000, 194);
		else
			position = math.random(1,5) + 57;
			player:setPos(position,8.5,-239,192);
			
			if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
				cs = 0x7534;
			end
			player:setVar("PlayerMainJob",0);
		end
	end
return cs;
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
	player:startEvent(0x0047);
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
	if (csid == 0x0001) then
		player:messageSpecial(ITEM_OBTAINED,536);
	elseif (csid == 0x0047) then
		player:setPos(0,0,0,0,224);
	elseif (csid == 0x7534 and option == 0) then
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	end
end;