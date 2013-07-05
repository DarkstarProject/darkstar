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

	player:messageSpecial(LIGHTNING_LAMP); -- lighting lampe
	GetNPCByID(16888066):openDoor(7);

	local element = VanadielDayElement();
	--printf("element: %u",element);
	
	if(element == 5)then -- lightningday
		if(GetNPCByID(16888064):getAnimation() == 8)then -- lampe water open ?
			GetNPCByID(16888062):openDoor(7);
		end
	elseif(element == 1)then -- earthday
		if(GetNPCByID(16888069):getAnimation() == 8)then -- lampe earth open ?
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