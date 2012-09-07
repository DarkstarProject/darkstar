-----------------------------------
-- 
-- Zone: Dynamis-San_dOria
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
require("scripts/zones/Dynamis-San_dOria/TextIDs");

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
			inst = player:addPlayerToDynamis(1281);
			
			if(inst == 1)then
				player:bcnmEnter(1281);
			else
				 return player:setPos(161.000,-2.000,161.000,94,0xE6);
			end
		else
			player:bcnmEnter(1281);
		end
	else
		inst = player:bcnmRegister(1281);
		
		if(inst == 1)then
			player:bcnmEnter(1281);
		else
			return player:setPos(161.000,-2.000,161.000,94,0xE6);
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



