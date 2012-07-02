-----------------------------------
-- Area: Windurst Waters
-- NPC:  Kerutoto
-- Starts Quest Food For Thought
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
	
	if(player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT) == QUEST_ACCEPTED and trade:hasItemQty(4371,1) and trade:getItemCount() == 1) then
		player:startEvent(0x014c,440);	
		player:setVar("Kerutoto_Food_var",2);
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
	KerutotoFood = player:getVar("Kerutoto_Food_var"); -- Variable to track progress of Kerutoto in Food for Thought
	FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	OhbiruFood = player:getVar("Ohbiru_Food_var"); -- Variable to track progress of Ohbiru-Dohbiru in Food for Thought

	
	if(FoodForThought == QUEST_AVAILABLE) then
		if(OhbiruFood == 1 and KerutotoFood ~= 256) then -- Player knows the researchers are hungry and quest not refused
			player:startEvent(0x0139,0,4371); -- Offered Quest 1 (Including Order ifYES)
		elseif(OhbiruFood == 1 and KerutotoFood == 256) then -- Player knows the researchers are hungry and quest refused previously
			player:startEvent(0x013a,0,4371); -- Offered Quest 2 (Including Order ifYES)
		else
			player:startEvent(0x0138); -- Before Quest: Asks you to check on others.
		end
	elseif(FoodForThought == QUEST_ACCEPTED) then
		if(KerutotoFood == 1)  then
			player:startEvent(0x013b,0,4371); -- Repeats Order
		elseif(KerutotoFood == 3) then	
			player:startEvent(0x014d); -- Reminder to check with the others if this NPC has already been fed
		end
	elseif(FoodForThought == QUEST_COMPLETED) then
		player:startEvent(0x0130); -- NPC is sleeping but feels full (post Food for Thought)
	else
		player:startEvent(0x0132); -- Standard Conversation 
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
		player:setVar("Kerutoto_Food_var",1);
	elseif(csid == 0x0139 and option == 1) then
		player:setVar("Kerutoto_Food_var",256);
	elseif(csid == 0x014c) then
		if(player:getVar("Kerutoto_Food_var") == 2 and player:getVar("Kenapa_Food_var") == 4 and player:getVar("Ohbiru_Food_var") == 3) then -- If this is the last NPC to be fed
			player:addGil(GIL_RATE*440);
			player:tradeComplete();
			player:setTitle(FAST_FOOD_DELIVERER);
			player:addFame(WINDURST,WIN_FAME*100);
			player:needToZone(true);
			player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
			player:setVar("Kerutoto_Food_var",0);		-- ------------------------------------------
			player:setVar("Kenapa_Food_var",0);			-- Erase all the variables used in this quest
			player:setVar("Ohbiru_Food_var",0);			-- ------------------------------------------
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*440);
			player:setVar("Kerutoto_Food_var",3); -- If this is NOT the last NPC given food, flag this NPC as completed.
		end		
	end
	
end;