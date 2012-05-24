-----------------------------------
-- Area: Windurst Woods
-- NPC:  Apururu
-- Involved in Quests: The kind cardian
-- @pos -11 -2 13 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Woods/TextIDs");

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
	
	-- Check if we are on Windurst Mission 1-2
	if(player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
		MissionStatus = player:getVar("MissionStatus");
		if(MissionStatus == 0) then
			player:startEvent(0x0089);
		elseif(MissionStatus < 4) then
			player:startEvent(0x008a);
		elseif(MissionStatus == 4) then -- Cardinals encountered, no orbs
			-- Mission's over - Bad end (ish anyway, you lost the orbs)
			player:startEvent(0x008f);
		elseif(MissionStatus == 5) then -- Cardinals not encountered
			-- Mission's over - Good end (you came back with the orbs)
			player:startEvent(0x0091);
		end
	else
		if(player:getQuestStatus(JEUNO,THE_KIND_CARDIAN) == QUEST_ACCEPTED) then 
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
	
	if(csid == 0x0089) then -- Windurst mission 1-2 start
		player:setVar("MissionStatus",1);
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
		player:setVar("MissionStatus_orb1",1);
		player:setVar("MissionStatus_orb2",1);
		player:setVar("MissionStatus_orb3",1);
		player:setVar("MissionStatus_orb4",1);
		player:setVar("MissionStatus_orb5",1);
		player:setVar("MissionStatus_orb6",1);
	elseif(csid == 0x008f or csid == 0x0091) then
		
		finishMissionTimeline(player,1,csid,option);
		
		player:setVar("MissionStatus_orb1",0);
		player:setVar("MissionStatus_orb2",0);
		player:setVar("MissionStatus_orb3",0);
		player:setVar("MissionStatus_orb4",0);
		player:setVar("MissionStatus_orb5",0);
		player:setVar("MissionStatus_orb6",0);
		
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