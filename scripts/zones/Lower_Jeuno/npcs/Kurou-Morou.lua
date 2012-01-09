-----------------------------------
-- Area: Lower Jeuno
-- Starts and Finishes Quest: Your Crystal Ball & Never to return
-- @zone 245
-- @pos -4 -6 -28
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(JEUNO,YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and trade:getItemCount() == 1) then 
		if(trade:hasItemQty(557,1) == true) then
			player:startEvent(0x00C0); -- CS for ahriman lens trade; Trading the lens to Kurou-Morou is optional
		elseif(trade:hasItemQty(556,1) == true) then
			player:startEvent(0x00C4); -- Trade divination sphere, finish quest
		end
	elseif(player:getQuestStatus(JEUNO,NEVER_TO_RETURN) == QUEST_ACCEPTED and trade:hasItemQty(12507,1) == true and trade:getItemCount() == 1) then 
		player:startEvent(0x00Cb); -- Finish "Never to return" quest
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	YourCrystalBall = player:getQuestStatus(JEUNO,YOUR_CRYSTAL_BALL);
	JFame = player:getFameLevel(JEUNO)

	if (JFame >= 2 and YourCrystalBall == QUEST_AVAILABLE) then 
		player:startEvent(0x00C2); -- Start "Your Crystal Ball" quest
	elseif(JFame >= 5 and YourCrystalBall == QUEST_COMPLETED and player:getQuestStatus(JEUNO,NEVER_TO_RETURN) == QUEST_AVAILABLE and player:getVar("QuestNeverToReturn_day") ~= VanadielDayOfTheYear()) then
		prog = player:getVar("QuestNeverToReturn_prog");
		if(prog <= 2) then 
			fortune = math.random(1,99);
			player:startEvent(0x00Cc,fortune); -- Required to get fortune read 3x on 3 diff game days before quest is kicked off
		elseif(prog == 3) then 
			player:startEvent(0x00Ca); -- Start "Never to return" quest
		end
	else 
		player:startEvent(0x00C1); -- Standard dialog
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
	if(csid == 0x00C2 and option == 0) then
		player:addQuest(JEUNO,YOUR_CRYSTAL_BALL);
	elseif(csid == 0x00C4) then
		player:setTitle(FORTUNETELLER_IN_TRAINING);
		player:addFame(JEUNO,30);
		player:tradeComplete(trade);
		player:completeQuest(JEUNO,YOUR_CRYSTAL_BALL);
	elseif(csid == 0x00Cc and option == 0) then 
		player:setVar("QuestNeverToReturn_prog", player:getVar("QuestNeverToReturn_prog") + 1);  -- Keep track of how many times the players fortune has been read
		player:setVar("QuestNeverToReturn_day", VanadielDayOfTheYear()); -- new vanadiel day
	elseif(csid == 0x00Ca and option == 0) then 
		player:addQuest(JEUNO,NEVER_TO_RETURN);
		player:setVar("QuestNeverToReturn_prog", 0);
		player:setVar("QuestNeverToReturn_day", 0);
	elseif(csid == 0x00Cb) then 
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13477);
		else
			player:addGil(1200);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*1200); 
			player:addItem(13477);
			player:messageSpecial(ITEM_OBTAINED,13477);
			player:addFame(JEUNO,30);
			player:tradeComplete(trade);
			player:completeQuest(JEUNO,NEVER_TO_RETURN);
		end
	end
end;