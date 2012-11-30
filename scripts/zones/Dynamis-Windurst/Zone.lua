-----------------------------------
-- 
-- Zone: Dynamis-Windurst
-- 
-----------------------------------
package.loaded["scripts/zones/Dynamis-Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-Windurst/TextIDs");

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
			inst = player:addPlayerToDynamis(1282);
			
			if(inst == 1)then
				player:bcnmEnter(1282);
			else
				 return player:setPos(-217.000,1.000,-119.000,94,0xEF);
			end
		else
			player:bcnmEnter(1282);
		end
	else
		inst = player:bcnmRegister(1282);
		
		if(inst == 1)then
			player:bcnmEnter(1282);
		else
			return player:setPos(-217.000,1.000,-119.000,94,0xEF);
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



