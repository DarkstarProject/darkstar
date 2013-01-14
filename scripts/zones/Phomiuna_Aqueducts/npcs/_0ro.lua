-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  Oil lamp
-- @pos -60 -23 60 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:messageSpecial(7168); -- ice lampe
	GetNPCByID(16888065):openDoor(7);

	local element = VanadielDayElement();
	--printf("element: %u",element);
	
	if(element == 0)then -- fireday
		if(GetNPCByID(16888071):getAnimation() == 8)then -- lampe fire open ?
			GetNPCByID(16888062):openDoor(7);
		end
	elseif(element == 4)then -- iceday
		if(GetNPCByID(16888070):getAnimation() == 8)then -- lampe wind open ?
			GetNPCByID(16888062):openDoor(7);
		end
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
end;