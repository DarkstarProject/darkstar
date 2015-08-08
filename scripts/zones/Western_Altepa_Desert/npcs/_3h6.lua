-----------------------------------
-- Area:  Western Altepa Desert
-- NPC:   _3h6 (Topaz Column)
-- Notes: Mechanism for Altepa Gate
-- @pos -260 10 -344 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local TopazID = npc:getID();
	local Ruby = GetNPCByID(TopazID-1):getAnimation();
	local Topaz = npc:getAnimation();
	local Emerald = GetNPCByID(TopazID+1):getAnimation();
	local Sapphire = GetNPCByID(TopazID+2):getAnimation();

	if (Topaz ~= 8) then
		npc:setAnimation(8);
		GetNPCByID(TopazID-4):setAnimation(8);
	else
		player:messageSpecial(DOES_NOT_RESPOND);
	end

	if (Emerald == 8 and Ruby == 8 and Sapphire == 8) then
		local rand = math.random(15,30);
		local timeDoor = rand * 60;

		-- Add timer for the door
		GetNPCByID(TopazID-6):openDoor(timeDoor);
		-- Add same timer for the 4 center lights
		GetNPCByID(TopazID-5):openDoor(timeDoor);
		GetNPCByID(TopazID-4):openDoor(timeDoor);
		GetNPCByID(TopazID-3):openDoor(timeDoor);
		GetNPCByID(TopazID-2):openDoor(timeDoor);
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