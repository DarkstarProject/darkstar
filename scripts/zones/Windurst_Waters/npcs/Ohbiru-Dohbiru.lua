-----------------------------------
--	Area: Windurst Waters
--	NPC:  Ohbiru-Dohbiru
--	Involved in quest: Food For Thought
--  Starts and finishes quest: Toraimarai Turmoil
-----------------------------------

package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;


require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	turmoil = player:getQuestStatus(WINDURST,TORAIMARAI_TURMOIL);
	
	if (FoodForThought == QUEST_ACCEPTED) then
		OhbiruFood = player:getVar("Ohbiru_Food_var"); 
		count = trade:getItemCount();
		gil = trade:getGil();
		if (trade:hasItemQty(4493,1) == true and trade:hasItemQty(4408,1) == true and trade:hasItemQty(624,1) == true and count == 3 and OhbiruFood ~= 2) then -- Traded all 3 items & Didn't ask for order
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x0145,440);
			else
				player:startEvent(0x0146);
			end
		elseif (trade:hasItemQty(4493,1) == true and trade:hasItemQty(4408,1) == true and trade:hasItemQty(624,1) == true and count == 3 and OhbiruFood == 2) then -- Traded all 3 items after receiving order
			player:startEvent(0x0142,440);
		end	
	elseif(turmoil == QUEST_ACCEPTED) then
		if(trade:getItemCount() == 3 and gil == 0 and trade:hasItemQty(906,3) == true) then --Check that all 3 items have been traded
			player:startEvent(0x0317);
		else 
			player:startEvent(0x0312,4500,267,906); -- Reminder of needed items
		end
	elseif(turmoil == QUEST_COMPLETED) then
		if(trade:getItemCount() == 3 and trade:getGil () == 0 and trade:hasItemQty(906,3) == true) then --Check that all 3 items have been traded
			player:startEvent(0x0317);
		else
			player:startEvent(0x031b,4500,0,906); -- Reminder of needed items for repeated quest
		end
	end
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Check for Missions first (priority?)
	-- If the player has started the mission or not
	pfame = player:getFameLevel(WINDURST);
	turmoil = player:getQuestStatus(WINDURST,TORAIMARAI_TURMOIL);
	FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	needToZone = player:needToZone();
	OhbiruFood = player:getVar("Ohbiru_Food_var"); -- Variable to track progress of Ohbiru-Dohbiru in Food for Thought

	if(player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
		if(player:getVar("ohbiru_dohbiru_talk") == 1) then
			player:startEvent(0x8f);
		else
			player:startEvent(0x90);
		end
	elseif(FoodForThought == QUEST_AVAILABLE and OhbiruFood == 0) then
		player:startEvent(0x0134); -- Hungry; mentions the experiment. First step in quest for this NPC.
		player:setVar("Ohbiru_Food_var",1);
	elseif(FoodForThought == QUEST_AVAILABLE and OhbiruFood == 1) then
		player:startEvent(0x0135); -- Hungry. The NPC complains of being hungry before the quest is active.
	elseif(FoodForThought == QUEST_ACCEPTED and OhbiruFood < 2) then
		player:startEvent(0x013c,0,4493,624,4408); -- Gives Order
		player:setVar("Ohbiru_Food_var",2);
	elseif(FoodForThought == QUEST_ACCEPTED and OhbiruFood == 2) then
		player:startEvent(0x013d,0,4493,624,4408); -- Repeats Order
	elseif(FoodForThought == QUEST_ACCEPTED and OhbiruFood == 3) then
		player:startEvent(0x0144); -- Reminds player to check on friends if he has been given his food.
	elseif(FoodForThought == QUEST_COMPLETED and needToZone == true) then
		player:startEvent(0x0158); -- Post Food for Thought Dialogue	
	--
	-- Begin Toraimarai Turmoil Section	
	--
	elseif(turmoil == QUEST_AVAILABLE and pfame >= 6 and needToZone == false) then 
		player:startEvent(0x0311,4500,267,906);
	elseif(turmoil == QUEST_ACCEPTED) then
		player:startEvent(0x0312,4500,267,906); -- Reminder of needed items
	elseif(turmoil == QUEST_COMPLETED) then
		player:startEvent(0x031b,4500,0,906); -- Allows player to initiate repeat of Toraimarai Turmoil
	else
		player:startEvent(0x0158);
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
	-- Check Missions first (priority?)
	turmoil = player:getQuestStatus(WINDURST,TORAIMARAI_TURMOIL);
	if(csid == 0x8f) then
		player:setVar("ohbiru_dohbiru_talk",2);
	elseif (csid == 0x0142 or csid == 0x0145)  then
		if(player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 4 and player:getVar("Ohbiru_Food_var") == 2) then -- If this is the last NPC to be fed
			player:tradeComplete();
			player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
			player:setTitle(FAST_FOOD_DELIVERER);
			player:addGil(GIL_RATE*440);
			player:setVar("Kerutoto_Food_var",0);		-- ------------------------------------------
			player:setVar("Kenapa_Food_var",0);			-- Erase all the variables used in this quest
			player:setVar("Ohbiru_Food_var",0);			-- ------------------------------------------
			player:addFame(WINDURST,WIN_FAME*100);
			player:needToZone(true);
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*440);
			player:setVar("Ohbiru_Food_var",3); -- If this is NOT the last NPC given food, flag this NPC as completed.
		end
	elseif(csid == 0x0146) then
		if(player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 4 and player:getVar("Ohbiru_Food_var") == 2) then -- If this is the last NPC to be fed
			player:tradeComplete();
			player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
			player:setTitle(FAST_FOOD_DELIVERER);
			player:addGil(GIL_RATE*440);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*440);
			player:setVar("Kerutoto_Food_var",0);		-- ------------------------------------------
			player:setVar("Kenapa_Food_var",0);			-- Erase all the variables used in this quest
			player:setVar("Ohbiru_Food_var",0);			-- ------------------------------------------
			player:addFame(WINDURST,WIN_FAME*100);
			player:needToZone(true);
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*440);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*440);
			player:setVar("Ohbiru_Food_var",3); -- If this is NOT the last NPC given food, flag this NPC as completed.
		end
	elseif(csid == 0x0311 and option == 1) then -- Adds Toraimarai turmoil
		player:addQuest(WINDURST,TORAIMARAI_TURMOIL);
		player:messageSpecial(KEYITEM_OBTAINED,267);
		player:addKeyItem(267); -- Rhinostery Certificate
	elseif(csid == 0x0317 and turmoil == QUEST_ACCEPTED) then -- Completes Toraimarai turmoil - first time
		player:addGil(GIL_RATE*4500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*4500);
		player:completeQuest(WINDURST,TORAIMARAI_TURMOIL);
		player:addFame(WINDURST,WIN_FAME*100);
		player:setTitle(CERTIFIED_RHINOSTERY_VENTURER);
		player:tradeComplete();
	elseif(csid == 0x0317 and turmoil == 2) then -- Completes Toraimarai turmoil - repeats
		player:addGil(GIL_RATE*4500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*4500);
		player:addFame(WINDURST,WIN_FAME*50);
		player:tradeComplete();
	end
end;



