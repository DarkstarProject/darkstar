-----------------------------------
-- Area: Windurst Woods
-- NPC:  Apururu
-- Involved in Quests: The kind cardian
-- @zone 241
-- @pos -11 -2 13
-----------------------------------

package.loaded["scripts/globals/missions"] = nil;
require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(JEUNO,THE_KIND_CARDIAN) == QUEST_ACCEPTED) then 
		if(trade:hasItemQty(969,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			player:startEvent(0x018d);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--player:delMission(WINDURST,THE_HEART_OF_THE_MATTER);
	--player:delKeyItem(DARK_MANA_ORB);
	--player:delKeyItem(SOUTHEASTERN_STAR_CHARM);
	
	TheKindCardian = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);
	
	-- Check for the missions first (priority?)
	-- Check if we are on Windurst Mission 1-2
	if(player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
		windurst_mission_1_2 = player:getVar("windurst_mission_1_2");
		if(windurst_mission_1_2 == 1) then
			-- Next step in the mission
			player:startEvent(0x89);
			-- Set the progress
			player:setVar("windurst_mission_1_2",2);
		elseif(windurst_mission_1_2 == 2) then
			-- The player has already had the cutscene
			-- (he will now talk about where the other taru is, kind of like a small reminder)
			player:startEvent(0x8a);
		elseif(windurst_mission_1_2 > 5) then -- 6 = cutscene skipped (since it's optional); 7 = cutscene seen;
			if(windurst_mission_1_2 == 6 ) then -- Cardinals not encountered
				-- Mission's over - Good end (you came back with the orbs)
				player:startEvent(0x91)
			elseif(windurst_mission_1_2 == 7) then -- Cardinals encountered, no orbs
				-- Mission's over - Bad end (ish anyway, you lost the orbs)
				player:startEvent(0x8f)
			end
		end
	else
		if(TheKindCardian == QUEST_ACCEPTED) then 
			if(player:getVar("theKindCardianVar") == 0) then 
				player:startEvent(0x0188);
			elseif(player:getVar("theKindCardianVar") == 1) then 
				player:startEvent(0x0189);
			elseif(player:getVar("theKindCardianVar") == 2) then 
				player:startEvent(0x018e);
			end
		else
			player:startEvent(0x0112);
		end
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
	if(csid == 0x89) then -- Windurst mission 1-2 start
		-- Give the player the key items
		player:addKeyItem(FIRST_DARK_MANA_ORB);
		player:addKeyItem(SECOND_DARK_MANA_ORB);
		player:addKeyItem(THIRD_DARK_MANA_ORB);
		player:addKeyItem(FOURTH_DARK_MANA_ORB);
		player:addKeyItem(FIFTH_DARK_MANA_ORB);
		player:addKeyItem(SIXTH_DARK_MANA_ORB);
		-- Display the key item messages
		player:messageSpecial(KEYITEM_OBTAINED,FIRST_DARK_MANA_ORB);
		player:messageSpecial(KEYITEM_OBTAINED,SECOND_DARK_MANA_ORB);
		player:messageSpecial(KEYITEM_OBTAINED,THIRD_DARK_MANA_ORB);
		player:messageSpecial(KEYITEM_OBTAINED,FOURTH_DARK_MANA_ORB);
		player:messageSpecial(KEYITEM_OBTAINED,FIFTH_DARK_MANA_ORB);
		player:messageSpecial(KEYITEM_OBTAINED,SIXTH_DARK_MANA_ORB);
		-- Set the orb variables; 1 = not handled; 2 = handled;
		player:setVar("windy_miss_1_2_orb1",1);
		player:setVar("windy_miss_1_2_orb2",1);
		player:setVar("windy_miss_1_2_orb3",1);
		player:setVar("windy_miss_1_2_orb4",1);
		player:setVar("windy_miss_1_2_orb5",1);
		player:setVar("windy_miss_1_2_orb6",1);
	elseif(csid == 0x8f) then -- Windurst Mission 1-2 is over (bad end)
		-- Returned with the key item, mission's over
		player:completeMission(WINDURST,THE_HEART_OF_THE_MATTER);
		-- Add Rank Points (Note: I have no idea how much should be added)
		player:addRankPoints(0);
		-- Remove all variables set for this mission
		player:setVar("windurst_mission_1_2",0);
		player:setVar("windy_miss_1_2_orb1",0);
		player:setVar("windy_miss_1_2_orb2",0);
		player:setVar("windy_miss_1_2_orb3",0);
		player:setVar("windy_miss_1_2_orb4",0);
		player:setVar("windy_miss_1_2_orb5",0);
		player:setVar("windy_miss_1_2_orb6",0);
	elseif(csid == 0x91) then -- Windurst Mission 1-2 is over (good end)
		-- Returned with the key item, mission's over
		player:completeMission(WINDURST,THE_HEART_OF_THE_MATTER);
		-- Add Rank Points (Note: I have no idea how much should be added)
		player:addRankPoints(0);
		-- Remove all variables set for this mission
		player:setVar("windurst_mission_1_2",0);
		player:setVar("windy_miss_1_2_orb1",0);
		player:setVar("windy_miss_1_2_orb2",0);
		player:setVar("windy_miss_1_2_orb3",0);
		player:setVar("windy_miss_1_2_orb4",0);
		player:setVar("windy_miss_1_2_orb5",0);
		player:setVar("windy_miss_1_2_orb6",0);
		
		-- Remove the glowing orb key items
		player:delKeyItem(FIRST_GLOWING_MANA_ORB);
		player:delKeyItem(SECOND_GLOWING_MANA_ORB);
		player:delKeyItem(THIRD_GLOWING_MANA_ORB);
		player:delKeyItem(FOURTH_GLOWING_MANA_ORB);
		player:delKeyItem(FIFTH_GLOWING_MANA_ORB);
		player:delKeyItem(SIXTH_GLOWING_MANA_ORB);
	elseif(csid == 0x0188 and option == 1) then 
		player:setVar("theKindCardianVar",1);
	elseif(csid == 0x018d) then 
		player:delKeyItem(TWO_OF_SWORDS);
		player:setVar("theKindCardianVar",2);
		player:addFame(WINDURST,WIN_FAME*30);
		player:tradeComplete();
	end
end;



