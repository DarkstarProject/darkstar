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
	local count = trade:getItemCount();
	if(player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(12521,1) and count == 1) then
			player:startEvent(0x016a);
		elseif(trade:hasItemQty(13569,1) and count == 1) then
			if(player:getVar("BlueRibbonBluesProg") == 4) then
				player:startEvent(0x016d); -- Lost, ribbon but it came back
			else
				player:startEvent(0x0166,3600);
			end
		end
	end
	if(player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT) == QUEST_ACCEPTED and trade:hasItemQty(4371,1) and count == 1) then
		player:startEvent(0x014c,440);	
		player:setVar("Kerutoto_Food_var",2);
	end
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 3) then
		if(trade:hasItemQty(1127,1) and count == 1) then -- Trade Kindred seal
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
	local KerutotoFood = player:getVar("Kerutoto_Food_var"); -- Variable to track progress of Kerutoto in Food for Thought
	local FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	local OhbiruFood = player:getVar("Ohbiru_Food_var"); -- Variable to track progress of Ohbiru-Dohbiru in Food for Thought
	local BlueRibbonBlues = player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES);
	local needZone = player:needToZone();
	
	if(BlueRibbonBlues == QUEST_COMPLETED and needZone) then
		player:startEvent(0x016b);
	elseif(BlueRibbonBlues == QUEST_ACCEPTED) then
		local blueRibbonProg = player:getVar("BlueRibbonBluesProg");
		if(player:hasItem(12521)) then
			player:startEvent(0x016a);
		elseif(blueRibbonProg == 2 and needZone == false) then
			local timerDay = player:getVar("BlueRibbonBluesTimer_Day");
			local currentDay = VanadielDayOfTheYear();
			
			if(player:getVar("BlueRibbonBluesTimer_Year") < VanadielYear()) then
				player:startEvent(0x0168); --  go to the grave
			elseif(timerDay + 1 == VanadielDayOfTheYear() and player:getVar("BlueRibbonBluesTimer_Hour") <= VanadielHour()) then
				player:startEvent(0x0168); --  go to the grave
			elseif(timerDay + 2 <=  VanadielDayOfTheYear()) then
				player:startEvent(0x0168); --  go to the grave
			else
				player:startEvent(0x0167); -- Thanks for the ribbon
			end
			
		elseif(blueRibbonProg == 3) then
			if(player:hasItem(13569)) then
				player:startEvent(0x0169,0,13569); -- remidner, go to the grave
			else
				player:startEvent(0x016e,0,13569); -- lost the ribbon
			end
		elseif(blueRibbonProg == 4) then
			player:startEvent(0x016e,0,13569); 
		else
			player:startEvent(0x0132); -- Standard Conversation 
		end
	elseif(BlueRibbonBlues == QUEST_AVAILABLE and player:getQuestStatus(WINDURST,WATER_WAY_TO_GO) == QUEST_COMPLETED and player:getFameLevel(WINDURST) >= 5) then
		player:startEvent(0x0165);
		
		
	elseif(FoodForThought == QUEST_AVAILABLE) then
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
	elseif(FoodForThought == QUEST_COMPLETED and needZone) then
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
	elseif(csid == 0x0165) then
		player:addQuest(WINDURST,BLUE_RIBBON_BLUES);
	elseif(csid == 0x0166 or csid == 0x016d) then
		player:tradeComplete();
		player:setVar("BlueRibbonBluesProg",2);
		player:setVar("BlueRibbonBluesTimer_Hour",VanadielHour()); 
		player:setVar("BlueRibbonBluesTimer_Year",VanadielYear()); 
		player:setVar("BlueRibbonBluesTimer_Day",VanadielDayOfTheYear());
		player:needToZone(true);
		if(csid == 0x0166) then
			player:addGil(GIL_RATE*3600);
		end
	elseif(csid == 0x0168) then
		if(player:getFreeSlotsCount() >= 1) then
			player:setVar("BlueRibbonBluesProg",3);
			player:setVar("BlueRibbonBluesTimer_Hour",0); 
			player:setVar("BlueRibbonBluesTimer_Year",0); 
			player:setVar("BlueRibbonBluesTimer_Day",0);	
			player:addItem(13569);
			player:messageSpecial(ITEM_OBTAINED,13569);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13569);
		end
	elseif(csid == 0x016a) then
		player:completeQuest(WINDURST,BLUE_RIBBON_BLUES);
		player:setVar("BlueRibbonBluesProg",0);
		player:addFame(WINDURST,WIN_FAME*140);
		player:setTitle(GHOSTIE_BUSTER);
		player:needToZone(true);
	end
	
end;