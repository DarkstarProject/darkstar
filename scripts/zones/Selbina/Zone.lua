-----------------------------------
--
-- Zone: Selbina (248)
--
-----------------------------------

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		if (prevZone == 220) then
			cs = 0x00ca;
			player:setPos(32.500,-2.500,-45.500,192);
		else
			player:setPos(17.981,-16.806,99.83,64);
		end
	end	
return cs;	
end;		

-----------------------------------		
-- onTransportEvent		
-----------------------------------		

function onTransportEvent(player,transport)	
	player:startEvent(0x00c8);
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
	if (csid == 0x00c8) then	
		player:setPos(0,0,0,0,221);
	end
end;	
