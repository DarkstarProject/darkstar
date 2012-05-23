-----------------------------------
--	Area: Port Windurst
--	NPC:  Hakkuru-Rinkuru
--  Involved In Quest: Making Amends
--  Starts and Ends Quest: Wonder Wands
--	Working 100%
-- @zone 240
-- @pos -111 -4 101
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS); --First quest in series
WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS); --Third and final quest in series
	if(MakingAmends == QUEST_ACCEPTED) then
		if(trade:getGil() == 0 and trade:hasItemQty(937,1) == true) then
			player:startEvent(0x0115,1500); 
		else
			player:startEvent(0x0113,0,937);
		end
	elseif(WonderWands == QUEST_ACCEPTED) then
		SecondReward = player:getVar("SecondRewardVar");
		if(trade:getItemCount() == 3 and trade:getGil () == 0 and trade:hasItemQty(17091,1) == true and trade:hasItemQty(17061,1) == true and trade:hasItemQty(17053,1) == true) then --Check that all 3 items have been traded, one each
			SecondReward = player:setVar("SecondRewardVar",1);
			player:startEvent(0x0109,0,17091,17061,17053); --Completion of quest cutscene for Wondering Wands
		else
			player:startEvent(0x0104,0,17091,17061,17053); --Remind player which items are needed if quest is accepted and items are not traded
		end
	else player:startEvent(0x00e0);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
	MakingAmens = player:getQuestStatus(WINDURST,MAKING_AMENS); --Second quest in series
	WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS); --Third and final quest in series
	pfame = player:getFameLevel(WINDURST);
	needToZone = player:needToZone();
	SecondRewardVar = player:getVar("SecondRewardVar");
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
-- Begin Making Amends Section
	elseif (MakingAmends == QUEST_AVAILABLE and pfame >= 2) then
			player:startEvent(0x0112,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Start
	elseif (MakingAmends == QUEST_ACCEPTED) then
			player:startEvent(0x0113,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Objective Reminder
	elseif (MakingAmends == QUEST_COMPLETED and needToZone == true) then
			player:startEvent(0x0116); -- MAKING AMENDS: After Quest
--End Making Amends Section; Begin Wonder Wands Section
	elseif (MakingAmends == QUEST_COMPLETED and MakingAmens == QUEST_COMPLETED and WonderWands == QUEST_AVAILABLE and pfame >= 5 and needToZone == false) then
			player:startEvent(0x0103); --Starts Wonder Wands
	elseif (WonderWands == QUEST_ACCEPTED) then
			player:startEvent(0x0104); --Reminder for Wonder Wands
	elseif (WonderWands == QUEST_COMPLETED) then
		if(SecondRewardVar == 1) then
		player:startEvent(0x010b); --Initiates second reward if Wonder Wands has been completed.
		else player:startEvent(0x00e0); --Plays default conversation once all quests in the series have been completed.
		end
	else 
		player:startEvent(0x00e0); --Standard Conversation
	end
-- End Wonder Wands Section
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
			player:setVar("windurst_mission_1_1_op1",0);
			player:setVar("windurst_mission_1_1_op2",0);
			player:setVar("windurst_mission_1_1_op3",0);
			player:setVar("windurst_mission_1_1_op4",0);
			player:setVar("windurst_mission_1_1_op5",0);
			player:setVar("windurst_mission_1_1_op6",0);
		end
	elseif(csid == 0x0112 and option == 1) then
			player:addQuest(WINDURST,MAKING_AMENDS);
	elseif (csid == 0x0115) then
			player:addGil(GIL_RATE*1500);
			player:completeQuest(WINDURST,MAKING_AMENDS);
			player:addFame(WINDURST,WIN_FAME*75);
			player:setTitle(QUICK_FIXER);
			player:needToZone(true);
			player:tradeComplete();
	elseif(csid == 0x0103 and option == 1) then
			player:addQuest(WINDURST,WONDER_WANDS);
	elseif(csid == 0x010b) then
		rand = math.random(3); --Setup random variable to determine which 2 items are returned upon quest completion
		if rand == 1 then
			player:addItem(17091,1);
			player:addItem(17061,1); --Returns the Oak Staff and the Mythril Rod
		elseif rand == 2 then
			player:addItem(17091,1);
			player:addItem(17053,1); --Returns the Oak Staff and the Rose Wand
		elseif rand == 3 then
			player:addItem(17061,1);
			player:addItem(17053,1); --Returns the Rose Wand and the Mythril Rod
		end
		player:setVar("SecondRewardVar",0);
	elseif(csid == 0x0109) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12750); -- New Moon Armlets
		else
			player:addGil(GIL_RATE*4800);
			player:messageSpecial(GIL_OBTAINED, 4800);
			player:addItem(12750); -- New Moon Armlets
			player:messageSpecial(ITEM_OBTAINED, 12750); -- New Moon Armlets
			player:addFame(WINDURST,WIN_FAME*150);
			player:setTitle(DOCTOR_SHANTOTTOS_GUINEA_PIG);
			player:completeQuest(WINDURST,WONDER_WANDS);
			player:tradeComplete();
			
		end
	end
end;



