-----------------------------------
-- 
-- Zone: Kazham-Jeuno_Airship
-- 
-----------------------------------

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
	if ((player:getXPos() ~= 0) or (player:getYPos() ~= 0) or (player:getZPos() ~= 0)) then	
		player:setPos(0,0,0,226);
	end
	return cs;
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
	player:startEvent(0x000A);
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
	if (csid == 0x000A) then
		prevzone = player:getPreviousZone();
		if (prevzone == 250) then
			player:setPos(0,0,0,0,246);
		elseif (prevzone == 246) then
			player:setPos(0,0,0,0,250);
		end
	end
end;