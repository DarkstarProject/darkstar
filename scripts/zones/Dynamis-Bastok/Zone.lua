-----------------------------------
-- 
-- Zone: Dynamis-Bastok
-- 
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Dynamis-Bastok/TextIDs");

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
	
	if(player:isBcnmsFull() == 1) then
		if(player:hasStatusEffect(EFFECT_DYNAMIS) == false) then
			inst = player:addPlayerToDynamis(1280);
			
			if(inst == 1)then
				player:bcnmEnter(1280);
			else
				player:setPos(112.000,0.994,-72.000,127,0xEA);
			end
		else
			player:bcnmEnter(1280);
		end
	else
		inst = player:bcnmRegister(1280);
		
		if(inst == 1)then
			player:bcnmEnter(1280);
		else
			player:setPos(112.000,0.994,-72.000,127,0xEA);
		end
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
end;



