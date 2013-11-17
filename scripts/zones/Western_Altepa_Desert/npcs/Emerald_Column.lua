-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  Emerald Column
-- Mechanism for Altepa Gate
-- @pos -775 2 -460 125
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
	
	Ruby = GetNPCByID(17289739):getAnimation();
	Topaz = GetNPCByID(17289740):getAnimation();
	Emerald = GetNPCByID(17289741):getAnimation();
	Sapphire = GetNPCByID(17289742):getAnimation();
	
	if(Emerald ~= 8) then
		GetNPCByID(17289741):setAnimation(8);
	end
	
	if(Sapphire == 8 and Ruby == 8 and Topaz == 8) then
		rand = math.random(15,30);
		timeDoor = rand * 60;
		
		-- Add timer for the door
		GetNPCByID(17289738):openDoor(timeDoor);
		-- Add same timer for the 4 columns
		GetNPCByID(17289739):openDoor(timeDoor);
		GetNPCByID(17289740):openDoor(timeDoor);
		GetNPCByID(17289741):openDoor(timeDoor);
		GetNPCByID(17289742):openDoor(timeDoor);
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