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

	player:messageSpecial(7166); -- water lampe
	GetNPCByID(16888064):openDoor(7);

	local element = VanadielDayElement();
	--printf("element: %u",element);

	if(element == 2)then -- waterday
		if(GetNPCByID(16888071):getAnimation() == 8)then -- lampe fire open ?
			GetNPCByID(16888062):openDoor(7);
		end
	elseif(element == 5)then -- lighningday
		if(GetNPCByID(16888066):getAnimation() == 8)then -- lampe lightning open ?
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