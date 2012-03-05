-----------------------------------
--
-- Zone: RuLude_Gardens (243)
--
-----------------------------------

package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
require("scripts/zones/RuLude_Gardens/TextIDs");

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
		position = math.random(1,5) + 45;	
		player:setPos(position,10,-73,192);	
		if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then	
			cs = 0x7534;
		end	
		player:setVar("PlayerMainJob",0);	
	end		
	return cs;		
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
	if (csid == 0x7534 and option == 0) then	
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	end	
end;		
