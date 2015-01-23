-----------------------------------
--  Area: Northern San d'Oria
--   NPC: Durogg
--  Type: Past Event Watcher
-- @zone: 231
--  @pos: 15 0 -18
-----------------------------------

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;

require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- Add-on Scenarios
	local AddonScenarios = 0xFFFFFFFE;
	if (player:hasCompletedMission(AMK,DRENCHED_IT_BEGAN_WITH_A_RAINDROP)) then
		AddonScenarios = AddonScenarios - 2; -- Drenched! It Began with a Raindrop.
	end
-- *Need the correct csid
--	if (player:hasCompletedMission(AMK,HASTEN_IN_A_JAM_IN_JEUNO)) then
--		AddonScenarios = AddonScenarios - 4; -- Hasten! In a Jam in Jeuno?
--	end

	-- Seekers of Adoulin
	local SeekersOfAdoulin = 0xFFFFFFFE;
-- *Need the correct csid
--	if (player:hasCompletedMission(SOA,RUMORS_FROM_THE_WEST)) then
--		SeekersOfAdoulin = SeekersOfAdoulin - 2; -- Rumors from the West
--	end

	-- Determine if any cutscenes are available for the player.
	local gil = player:getGil();
	if (AddonScenarios    == 0xFFFFFFFE and 
	    SeekersOfAdoulin  == 0xFFFFFFFE)
	then -- Player has no cutscenes available to be viewed.
		gil = 0; -- Setting gil to a value less than 10(cost) will trigger the appropriate response from this npc.
	end

	player:startEvent(0x0361,AddonScenarios,SeekersOfAdoulin,0xFFFFFFFE,0xFFFFFFFE,0xFFFFFFFE,0xFFFFFFFE,10,gil); -- CSID,Missions,Fame,?,?,?,?,Cost,TotalGilPlayerHas
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	
	if (player:delGil(10) == false) then
		player:setLocalVar("Durogg_PlayCutscene", 2) ; -- Cancel the cutscene.
		player:updateEvent(0);
	else
		player:setLocalVar("Durogg_PlayCutscene", 1) 
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	if (player:getLocalVar("Durogg_PlayCutscene") < 2) then
		if (   option ==   1) then		-- Drenched! It Began with a Raindrop
			player:startEvent(0x7549,0,0,0,0,0,0,231);
--		elseif (option ==   2) then		-- Hasten! In a Jam in Jeuno?
--			player:startEvent(CSID,0,0,0,0,0,0,231);
--		elseif (option ==  33) then		-- Rumors from the West
--			player:startEvent(CSID);
		end
	end

	player:setLocalVar("Durogg_PlayCutscene", 0)
end;
