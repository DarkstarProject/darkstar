-----------------------------------
-- Area: Windurst Waters
-- NPC:  Kerutoto
-- Starts and Finishes Quest Food For Thought
-- Involved in Quest: Riding on the Clouds
-- @zone 238
-- @pos 13 -5 -157
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(4371,1) and trade:getItemCount() == 1) then -- Traded Correctly (Grilled Hare)
			player:startEvent(0x014c,440);	
		elseif(trade:hasItemQty(4358,1) and trade:getItemCount() == 1) then -- Traded Wrong Item (Hare Meat)
			player:startEvent(0x014e);
		end
		player:tradeComplete(trade);
	end
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 3) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_4",0);
			player:tradeComplete();
			player:addKeyItem(SPIRITED_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
		end
	end
	
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end
	
	foodstatus = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	
	if(foodstatus == 0) then
		prog = player:getVar("QuestFoodForThought_var"); 
		-- 	Variable to track quest progress
		-- 	1 = Ohbiru: Hungry
		--	2 = Kenapa: Hungry
		--  4 = Kerutoto: Quest Refused 
		-- 	8 = Ohbiru: Order		
		--	16 = Kenapa: Stammer 1/3
		--	32 = Kenapa: Stammer 2/3
		--	64 = Kenapa: Order 3/3
		--  128 = Ohbiru: Gave Food
		--  256 = Kenapa: Gave Food
		--  512 = Kerutoto: Gave Food
		--  1024 = Kerutoto: Initial Chat
		if(testflag(tonumber(prog),1) == true and testflag(tonumber(prog),2) == true and testflag(tonumber(prog),4) == false) then -- Player knows his friends are hungry and quest not refused
			player:startEvent(0x0139,0,4371); -- Offered Quest 1 (Including Order ifYES)
		elseif(testflag(tonumber(prog),1) == true and testflag(tonumber(prog),2) == true and testflag(tonumber(prog),4) == true) then -- Player knows his friends are hungry and quest refused previously
			player:startEvent(0x013a,0,4371); -- Offered Quest 2 (Including Order ifYES)
		else
			player:startEvent(0x0138); -- Before Quest: Asks you to check on others.
		end
	elseif(foodstatus == 1) then
		prog = player:getVar("QuestFoodForThought_var"); 
		if(testflag(tonumber(prog),512) == false)  then
			player:startEvent(0x013b,0,4371); -- Repeats Order
		elseif(testflag(tonumber(prog),512) == true and (testflag(tonumber(prog),128) == false or testflag(tonumber(prog),256) == false)) then	
			player:startEvent(0x014d); -- Reminder to check with the others
		elseif(testflag(tonumber(prog),128) == true and testflag(tonumber(prog),256) == true and testflag(tonumber(prog),512) == true) then	
			player:startEvent(0x014f); -- Finishes Quest (Quest TurnIn)
		end
	else
		rand = math.random(1,2);
		if(rand == 1) then
			player:startEvent(0x0130); -- Standard Conversation 1
		else
			player:startEvent(0x0132); -- Standard Conversation 2
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
	
	if((csid == 0x0139 and option == 0) or (csid == 0x013a and option == 0)) then
		player:addQuest(WINDURST,FOOD_FOR_THOUGHT);
	elseif(csid == 0x0139 and option == 1) then
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+4);
	elseif(csid == 0x014c) then
		player:addGil(GIL_RATE*440);
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+512);
		player:tradeComplete(trade);
	elseif(csid == 0x014e) then
		player:addGil(GIL_RATE*220);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*220);
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+512);
		player:tradeComplete(trade);
	elseif(csid == 0x014f) then
		player:setVar("QuestFoodForThought_var",0);
		player:setTitle(FAST_FOOD_DELIVERER);
		player:addFame(WINDURST,WIN_FAME*100);
		player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
	end
	
end;