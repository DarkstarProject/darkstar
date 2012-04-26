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
	-- Porte Bleu: 17502619, 17502618, 17502617, 17502616, 17502615, 17502614, 17502613
	-- Activateur Jaune: 17502629, 17502627, 17502625, 17502623, 17502621
	-- Porte Jaune: 17502605, 17502606, 17502607, 17502608, 17502609, 17502610, 17502611, 17502612
	
	nID = npc:getID();
	
	if(nID == 17502639 or nID == 17502637 or nID == 17502635 or nID == 17502633 or nID == 17502631) then
		GetNPCByID(17502619):setAnimation(8);
		GetNPCByID(17502618):setAnimation(8);
		GetNPCByID(17502617):setAnimation(8);
		GetNPCByID(17502616):setAnimation(8);
		GetNPCByID(17502615):setAnimation(8);
		GetNPCByID(17502614):setAnimation(8);
		GetNPCByID(17502613):setAnimation(8);
		GetNPCByID(17502605):setAnimation(9);
		GetNPCByID(17502606):setAnimation(9);
		GetNPCByID(17502607):setAnimation(9);
		GetNPCByID(17502608):setAnimation(9);
		GetNPCByID(17502609):setAnimation(9);
		GetNPCByID(17502610):setAnimation(9);
		GetNPCByID(17502611):setAnimation(9);
		GetNPCByID(17502612):setAnimation(9);
	else
		GetNPCByID(17502619):setAnimation(9);
		GetNPCByID(17502618):setAnimation(9);
		GetNPCByID(17502617):setAnimation(9);
		GetNPCByID(17502616):setAnimation(9);
		GetNPCByID(17502615):setAnimation(9);
		GetNPCByID(17502614):setAnimation(9);
		GetNPCByID(17502613):setAnimation(9);
		GetNPCByID(17502605):setAnimation(8);
		GetNPCByID(17502606):setAnimation(8);
		GetNPCByID(17502607):setAnimation(8);
		GetNPCByID(17502608):setAnimation(8);
		GetNPCByID(17502609):setAnimation(8);
		GetNPCByID(17502610):setAnimation(8);
		GetNPCByID(17502611):setAnimation(8);
		GetNPCByID(17502612):setAnimation(8);
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