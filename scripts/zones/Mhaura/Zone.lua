-----------------------------------
--
-- Zone: Mhaura (249)
--
-----------------------------------

package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/zones/Mhaura/TextIDs");

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
		if (prevZone == 221 or prevZone == 47) then
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
	if (transport == 47) then 
		if (not(player:hasKeyItem(BOARDING_PERMIT))) then
			player:setPos(8.200,-1.363,3.445,192);
			player:messageSpecial(DO_NOT_PROSSESS, BOARDING_PERMIT);
		else
			player:startEvent(0x00c8,0,0,0,0,0,0,0,0,46);
		end
	else
		player:startEvent(0x00c8,0,0,0,0,0,0,0,0,220);
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
		player:setPos(0,0,0,0,option);
	end
end;	