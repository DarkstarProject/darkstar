-----------------------------------
--	Area: Port Windurst
--	NPC:  Hakkuru-Rinkuru
--  Involved In Quest: Making Amends
--	Working 100%
-----------------------------------

package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
	if (MakingAmends == QUEST_ACCEPTED and trade:getItemCount() == 1 and trade:getGil() == 0 and trade:hasItemQty(937,1) == true) then
		player:startEvent(0x0115,1500); 
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Check for the missions first (priority?)
	-- Check if we are on Windurst Mission 1-1
	if(player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT) then
		windurst_mission_1_1 = player:getVar("windurst_mission_1_1");
		if(windurst_mission_1_1 == 1) then
			-- Next step in the mission
			player:startEvent(0x5a);
			-- Set the progress
			player:setVar("windurst_mission_1_1",2);
		elseif(windurst_mission_1_1 == 2) then
			-- The player has already had the cutscene
			-- (he will now talk about where the other taru is, kind of like a small reminder)
			player:startEvent(0x5b);
		elseif(windurst_mission_1_1 == 4) then
			-- Returned with the key item, mission's over
			player:startEvent(0x5e)
		end
	else
		MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
		pfame = player:getFameLevel(WINDURST);
		if (MakingAmends == QUEST_AVAILABLE and pfame >= 2) then
			player:startEvent(0x0112,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Start
		elseif (MakingAmends == QUEST_ACCEPTED) then
			player:startEvent(0x0113,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Objective Reminder
		elseif (MakingAmends == QUEST_COMPLETED and player:needToZone()) then
			player:startEvent(0x0116); -- MAKING AMENDS: After Quest
		else
			player:startEvent(0x00e0); -- Standard Conversation
		end
	end
--========================player:delQuest(WINDURST,MAKING_AMENDS);  ---  TESTING ONLY -------
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
	-- Check for the missions first (priority?)
	-- Check if we are on Windurst Mission 1-1
	if(player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT and csid == 0x5e) then
		windurst_mission_1_1 = player:getVar("windurst_mission_1_1");
		if(windurst_mission_1_1 == 4) then
			-- Returned with the key item, mission's over
			player:completeMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT);
			-- Remove the temporary key item
			player:delKeyItem(CRACKED_MANA_ORBS);
			-- Add Rank Points (Note: I have no idea how much should be added)
			player:addRankPoints(0);
			-- Get one of the 4 titles
			started_from_guard = player:getVar("mission_started_from");
			if(started_from_guard == 1 ) then
				player:setTitle(NEW_BUUMAS_BOOMERS_RECRUIT);
			elseif(started_from_guard == 2 ) then
				player:setTitle(FRESH_NORTH_WINDS_RECRUIT);
			elseif(started_from_guard == 3 ) then
				player:setTitle(NEW_BEST_OF_THE_WEST_RECRUIT);
			else
				player:setTitle(HEAVENS_TOWER_GATEHOUSE_RECRUIT);
			end
			
			-- Delete the variable(s) that was created for this mission
			player:setVar("windurst_mission_1_1",0);
			player:setVar("mission_started_from",0);
		end
	else
		if (csid == 0x0112 and option == 1) then
			player:addQuest(WINDURST,MAKING_AMENDS);
		elseif (csid == 0x0115) then
			player:addGil(GIL_RATE*1500);
			player:completeQuest(WINDURST,MAKING_AMENDS);
			player:addFame(WINDURST,WIN_FAME*75);
			player:setTitle(QUICK_FIXER);
			player:needToZone(true);
		end
	end
end;



