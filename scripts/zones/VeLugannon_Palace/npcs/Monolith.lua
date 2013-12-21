-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Monolith
-- @pos <many>
-----------------------------------
package.loaded["scripts/zones/VeLugannon_Palace/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/VeLugannon_Palace/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Activateur Bleu: 17502639, 17502637, 17502635, 17502633, 17502631
	-- Blue doors: 17502619, 17502618, 17502617, 17502616, 17502615, 17502614, 17502613
	-- Activateur Jaune: 17502629, 17502627, 17502625, 17502623, 17502621
	-- Yellow doors: 17502605, 17502606, 17502607, 17502608, 17502609, 17502610, 17502611, 17502612
	
	local nID = npc:getID();
	
	if(nID == 17502640 or nID == 17502638 or nID == 17502636 or nID == 17502634 or nID == 17502632) then
		GetNPCByID(17502620):setAnimation(8);--blue door
		GetNPCByID(17502619):setAnimation(8);
		GetNPCByID(17502618):setAnimation(8);
		GetNPCByID(17502617):setAnimation(8);
		GetNPCByID(17502616):setAnimation(8);
		GetNPCByID(17502615):setAnimation(8);
		GetNPCByID(17502614):setAnimation(8);
		GetNPCByID(17502606):setAnimation(9);--yellow door
		GetNPCByID(17502607):setAnimation(9);
		GetNPCByID(17502608):setAnimation(9);
		GetNPCByID(17502609):setAnimation(9);
		GetNPCByID(17502610):setAnimation(9);
		GetNPCByID(17502611):setAnimation(9);
		GetNPCByID(17502612):setAnimation(9);
		GetNPCByID(17502613):setAnimation(9);
		GetNPCByID(17502639):setAnimation(8);--blue monolith
		GetNPCByID(17502637):setAnimation(8);
		GetNPCByID(17502635):setAnimation(8);
		GetNPCByID(17502633):setAnimation(8);
		GetNPCByID(17502631):setAnimation(8);
		GetNPCByID(17502629):setAnimation(9);--yellow monolith
		GetNPCByID(17502627):setAnimation(9);
		GetNPCByID(17502625):setAnimation(9);
		GetNPCByID(17502623):setAnimation(9);
		GetNPCByID(17502621):setAnimation(9);
	else
		GetNPCByID(17502620):setAnimation(9);
		GetNPCByID(17502619):setAnimation(9);
		GetNPCByID(17502618):setAnimation(9);
		GetNPCByID(17502617):setAnimation(9);
		GetNPCByID(17502616):setAnimation(9);
		GetNPCByID(17502615):setAnimation(9);
		GetNPCByID(17502614):setAnimation(9);
		GetNPCByID(17502606):setAnimation(8);
		GetNPCByID(17502607):setAnimation(8);
		GetNPCByID(17502608):setAnimation(8);
		GetNPCByID(17502609):setAnimation(8);
		GetNPCByID(17502610):setAnimation(8);
		GetNPCByID(17502611):setAnimation(8);
		GetNPCByID(17502612):setAnimation(8);
		GetNPCByID(17502613):setAnimation(8);
		GetNPCByID(17502639):setAnimation(9);
		GetNPCByID(17502637):setAnimation(9);
		GetNPCByID(17502635):setAnimation(9);
		GetNPCByID(17502633):setAnimation(9);
		GetNPCByID(17502631):setAnimation(9);
		GetNPCByID(17502629):setAnimation(8);
		GetNPCByID(17502627):setAnimation(8);
		GetNPCByID(17502625):setAnimation(8);
		GetNPCByID(17502623):setAnimation(8);
		GetNPCByID(17502621):setAnimation(8);
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