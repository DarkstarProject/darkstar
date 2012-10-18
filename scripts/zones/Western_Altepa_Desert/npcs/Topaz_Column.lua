-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  Topaz Column
-- Mechanism for Altepa Gate
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
	
	Ruby = GetNPCByID(17289740):getAnimation();
	Topaz = GetNPCByID(17289741):getAnimation();
	Emerald = GetNPCByID(17289742):getAnimation();
	Sapphire = GetNPCByID(17289743):getAnimation();
	
	if(Topaz ~= 8) then
		GetNPCByID(17289741):setAnimation(8);
	end
	
	if(Emerald == 8 and Ruby == 8 and Sapphire == 8) then
		rand = math.random(15,30);
		timeDoor = rand * 60;
		
		-- Add timer for the door
		GetNPCByID(17289739):openDoor(timeDoor);
		-- Add same timer for the 4 columns
		GetNPCByID(17289740):openDoor(timeDoor);
		GetNPCByID(17289741):openDoor(timeDoor);
		GetNPCByID(17289742):openDoor(timeDoor);
		GetNPCByID(17289743):openDoor(timeDoor);
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