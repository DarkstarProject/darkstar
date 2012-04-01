-----------------------------------
--
-- Zone: Aht_Urhgan_Whitegate (50)
--
-----------------------------------

package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

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
	-- MOG HOUSE EXIT	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		if (prevZone == 46) then		
			cs = 0x00C9;
			player:setPos(-11.958, 2.000, -136.811, 192);	
		else	
			position = math.random(1,5) - 83;
			player:setPos(-100,0,position,0);
		end
	end	
	return cs;	
end;		

-----------------------------------		
-- onTransportEvent		
-----------------------------------		

function onTransportEvent(player,transport)
	if (transport == 46) then 
		player:startEvent(0x00c8);
	end
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
		player:setPos(0,0,0,0,47);
	end
end;