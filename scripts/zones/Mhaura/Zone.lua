-----------------------------------
--
-- Zone: Mhaura (249)
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
		if (prevZone == 221) then
			cs = 0x00ca;
			player:setPos(14.960,-3.430,18.423,192);
		else
			player:setPos(0.003,-6.252,117.971,65);
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
		player:setPos(0,0,0,0,220);
	end
end;	