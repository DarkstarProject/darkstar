-----------------------------------
--	Area: Windurst Waters
--	NPC: Tosuka-Porika
--	Involved in Quests: Hat in Hand
--	Working 100%
--  @zone = 238
--  @pos = -26 -6 103
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- cs notes
	-- 0x172 (370) = You have no mission, gtfo
	-- 0x17b (379) = Not sure yet (Adventurer from the other day?)
	-- 0x17c (380) = About the book of gods and "some adventurer"
	-- 0xa0 (160) = 1st cutscene of Windurst Mission 2-1
	-- 0xa1 (161) = More info on 2-1, if you talk to him right after the previous cutscene again
	
	-- Check if we are on Windurst Mission 2-1
	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS) then
		windurst_mission_2_1 = player:getVar("windurst_mission_2_1");
		if(windurst_mission_2_1 == 1) then
			player:startEvent(0xa0);
		elseif(windurst_mission_2_1 > 1 and windurst_mission_2_1 < 7) then
			player:startEvent(0xa1);
		elseif(windurst_mission_2_1 == 7) then
			-- We're done with the mission
			player:startEvent(0xa8);
		end
	else
		function testflag(set,flag)
			return (set % (2*flag) >= flag)
		end
		hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
		if ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),32) == false) then
			player:startEvent(0x0037); -- Show Off Hat

		end
	end
	--player:delQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);

	bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
	glyphStatus = player:getQuestStatus(WINDURST,GLYPH_HANGER);
	Fame = player:getFameLevel(WINDURST)
		
	if(bookwormStatus == QUEST_AVAILABLE and player:getCurrentMission(WINDURST) ~= LOST_FOR_WORDS and glyphStatus == QUEST_COMPLETED and Fame >= 2) then
		player:startEvent(0x0183); -- Accept quest 
	
	elseif(bookwormStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0184); -- Dialogue after accepting quest
		
	else
		player:startEvent(0x0172); -- Standard Conversation
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
	if (csid == 0x0037) then  -- Show Off Hat
		player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+32);
		player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
	elseif(csid == 0xa0) then -- Windurst Mission 2-1
		player:setVar("windurst_mission_2_1",2);
	elseif(csid == 0xa8) then -- Windurst Mission 1-2 is over (good end)
		-- Returned with the key item, mission's over
		player:completeMission(WINDURST,LOST_FOR_WORDS);
		-- Add Rank Points (Note: I have no idea how much should be added)
		player:addRankPoints(0);
		-- Remove all variables set for this mission
		player:setVar("windurst_mission_2_1",0);
		player:setVar("wm_2_1_randfoss",0);
	end
	if(csid == 0x0183 and option == 0) then -- Early Bird Gets The Bookworm
		player:addQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
	end
end;



