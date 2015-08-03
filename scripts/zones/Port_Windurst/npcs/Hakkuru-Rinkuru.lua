-----------------------------------
-- Area: Port Windurst
-- NPC:  Hakkuru-Rinkuru
-- Involved In Quest: Making Amends
-- Starts and Ends Quest: Wonder Wands
-- @pos -111 -4 101 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(WINDURST,MAKING_AMENDS) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(937,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0115,1500); 
		else
			player:startEvent(0x0113,0,937);
		end
	elseif (player:getQuestStatus(WINDURST,WONDER_WANDS) == QUEST_ACCEPTED) then
		SecondReward = player:getVar("SecondRewardVar");
		if (trade:hasItemQty(17091,1) and trade:hasItemQty(17061,1) and trade:hasItemQty(17053,1) and trade:getItemCount() == 3) then --Check that all 3 items have been traded, one each
			SecondReward = player:setVar("SecondRewardVar",1);
			player:startEvent(0x0109,0,17091,17061,17053); --Completion of quest cutscene for Wondering Wands
		else
			player:startEvent(0x0104,0,17091,17061,17053); --Remind player which items are needed ifquest is accepted and items are not traded
		end
	else 
		player:startEvent(0x00e0);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
	MakingAmens = player:getQuestStatus(WINDURST,MAKING_AMENS); --Second quest in series
	WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS); --Third and final quest in series
	needToZone = player:needToZone();
	pFame = player:getFameLevel(WINDURST);
	
		-- ~[ Windurst Mission 6-1 Full Moon Fountain ]~ --
	if (player:getCurrentMission(WINDURST) == FULL_MOON_FOUNTAIN and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x01C8,0,248);
	elseif (player:getCurrentMission(WINDURST) == FULL_MOON_FOUNTAIN and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x01C9);
	-- Check if we are on Windurst Mission 1-1
	elseif (player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT) then
		MissionStatus = player:getVar("MissionStatus");
		if (MissionStatus == 0) then
			player:startEvent(0x005a);
		elseif (MissionStatus == 1) then
			player:startEvent(0x005b);
		elseif (MissionStatus == 3) then
			player:startEvent(0x005e,0,CRACKED_MANA_ORBS); -- Finish Mission 1-1
		end
	elseif (player:getCurrentMission(WINDURST) == TO_EACH_HIS_OWN_RIGHT and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x0093);
-- Begin Making Amends Section
	elseif (MakingAmends == QUEST_AVAILABLE and pFame >= 2) then
			player:startEvent(0x0112,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Start
	elseif (MakingAmends == QUEST_ACCEPTED) then
			player:startEvent(0x0113,0,937); -- MAKING AMENDS + ANIMAL GLUE: Quest Objective Reminder
	elseif (MakingAmends == QUEST_COMPLETED and needToZone == true) then
			player:startEvent(0x0116); -- MAKING AMENDS: After Quest
--End Making Amends Section; Begin Wonder Wands Section
	elseif (MakingAmends == QUEST_COMPLETED and MakingAmens == QUEST_COMPLETED and WonderWands == QUEST_AVAILABLE and pFame >= 5 and needToZone == false) then
			player:startEvent(0x0103); --Starts Wonder Wands
	elseif (WonderWands == QUEST_ACCEPTED) then
			player:startEvent(0x0104); --Reminder for Wonder Wands
	elseif (WonderWands == QUEST_COMPLETED) then
		if (player:getVar("SecondRewardVar") == 1) then
			player:startEvent(0x010b); --Initiates second reward ifWonder Wands has been completed.
		else 
			player:startEvent(0x00e0); --Plays default conversation once all quests in the series have been completed.
		end
	else 
		player:startEvent(0x00e0); --Standard Conversation
	end
-- End Wonder Wands Section
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
	
	if (csid == 0x005a) then
		player:setVar("MissionStatus",1);
	elseif (csid == 0x0093) then
		player:setVar("MissionStatus",3);
	elseif (csid == 0x005e) then
	
		-- Delete the variable(s) that was created for this mission
		player:setVar("Mission_started_from",0);
		player:setVar("MissionStatus_op1",0);
		player:setVar("MissionStatus_op2",0);
		player:setVar("MissionStatus_op3",0);
		player:setVar("MissionStatus_op4",0);
		player:setVar("MissionStatus_op5",0);
		player:setVar("MissionStatus_op6",0);
		
		finishMissionTimeline(player,1,csid,option);
		
	elseif (csid == 0x0112 and option == 1) then
			player:addQuest(WINDURST,MAKING_AMENDS);
	elseif (csid == 0x0115) then
			player:addGil(GIL_RATE*1500);
			player:completeQuest(WINDURST,MAKING_AMENDS);
			player:addFame(WINDURST,WIN_FAME*75);
			player:addTitle(QUICK_FIXER);
			player:needToZone(true);
			player:tradeComplete();
	elseif (csid == 0x0103 and option == 1) then
			player:addQuest(WINDURST,WONDER_WANDS);
	elseif (csid == 0x010b) then
		rand = math.random(3); --Setup random variable to determine which 2 items are returned upon quest completion
		if (rand == 1) then
			player:addItem(17091,1);
			player:addItem(17061,1); --Returns the Oak Staff and the Mythril Rod
		elseif (rand == 2) then
			player:addItem(17091,1);
			player:addItem(17053,1); --Returns the Oak Staff and the Rose Wand
		elseif (rand == 3) then
			player:addItem(17061,1);
			player:addItem(17053,1); --Returns the Rose Wand and the Mythril Rod
		end
		player:setVar("SecondRewardVar",0);
	elseif (csid == 0x0109) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12750); -- New Moon Armlets
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*4800);
			player:messageSpecial(GIL_OBTAINED, 4800);
			player:addItem(12750); -- New Moon Armlets
			player:messageSpecial(ITEM_OBTAINED, 12750); -- New Moon Armlets
			player:addFame(WINDURST,WIN_FAME*150);
			player:addTitle(DOCTOR_SHANTOTTOS_GUINEA_PIG);
			player:completeQuest(WINDURST,WONDER_WANDS);
		end
		-- ~[ Windurst Mission 6-1 Full Moon Fountain ]~ --
	elseif (csid == 0x01C8) then
			player:setVar("MissionStatus",1);
			player:addKeyItem(SOUTHWESTERN_STAR_CHARM);
			player:messageSpecial(KEYITEM_OBTAINED,SOUTHWESTERN_STAR_CHARM);
	end
	
end;
