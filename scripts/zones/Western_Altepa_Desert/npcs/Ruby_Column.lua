-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  Ruby Column
-- Mechanism for Altepa Gate
-- @pos 59 10 -104 125
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
	printf("Ruby: %u",Ruby);
	printf("Topaz: %u",Topaz);
	printf("Emerald: %u",Emerald);
	printf("Sapphire: %u",Sapphire);
	if(Ruby ~= 8) then
		GetNPCByID(17289739):setAnimation(8);
	end
	
	if(Emerald == 8 and Sapphire == 8 and Topaz == 8) then
		randT = math.random(15,30);
		randT = rand * 60;
		
		-- Add timer for the door
		GetNPCByID(17289738):openDoor(randT);
		-- Add same timer for the 4 columns
		GetNPCByID(17289739):openDoor(randT);
		GetNPCByID(17289740):openDoor(randT);
		GetNPCByID(17289741):openDoor(randT);
		GetNPCByID(17289742):openDoor(randT);
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