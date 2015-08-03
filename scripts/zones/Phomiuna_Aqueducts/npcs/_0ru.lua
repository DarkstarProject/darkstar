-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  Oil lamp
-- @pos -63.699 -26.227 43.009 27
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

	local DoorOffset = npc:getID();

	player:messageSpecial(LAMP_OFFSET); -- fire lamp
	npc:openDoor(7); -- lamp animation

	local element = VanadielDayElement();
	--printf("element: %u",element);

	if (element == 0) then -- fireday
		if (GetNPCByID(DoorOffset-6):getAnimation() == 8) then -- ice lamp open?
			GetNPCByID(DoorOffset-9):openDoor(15); -- Door _0rk
		end
	elseif (element == 2) then  -- waterday
		if (GetNPCByID(DoorOffset-5):getAnimation() == 8) then -- water lamp open?
			GetNPCByID(DoorOffset-9):openDoor(15); -- Door _0rk
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