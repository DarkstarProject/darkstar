-----------------------------------
-- Area: Windurst Waters
-- NPC:  Kerutoto
-- Starts Quest Food For Thought
-- Involved in Quest: Riding on the Clouds
-- @zone 238
-- @pos 13 -5 -157
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------
require("scripts/globals/missions");
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
	if (player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(12521,1) and count == 1) then
			player:startEvent(0x016a);
		elseif (trade:hasItemQty(13569,1) and count == 1) then
			if (player:getVar("BlueRibbonBluesProg") == 4) then
				player:startEvent(0x016d); -- Lost, ribbon but it came back
			else
				player:startEvent(0x0166,3600);
			end
		end
	end
	if (player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT) == QUEST_ACCEPTED and trade:hasItemQty(4371,1) and count == 1) then
		player:startEvent(0x014c,440);	
		player:setVar("Kerutoto_Food_var",2);
	end
	
	if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 3) then
		if (trade:hasItemQty(1127,1) and count == 1) then -- Trade Kindred seal
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
	local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	local waking_dreams = player:getQuestStatus(WINDURST,WAKING_DREAMS)
	
	-- Awakening of the Gods --
	if (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x02E1);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x02E0);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x02E2);
		
	-- Three Paths --
	elseif (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") == 3) then  
	    player:startEvent(0x036c);
		
	-- Waking Dreams --
	elseif (player:hasKeyItem(VIAL_OF_DREAM_INCENSE)==false and ((player:hasCompletedMission(COP,DARKNESS_NAMED) and  waking_dreams == QUEST_AVAILABLE ) or(waking_dreams  == QUEST_COMPLETED and realday ~= player:getVar("Darkness_Named_date")))) then
	    player:addQuest(WINDURST,WAKING_DREAMS);
	    player:startEvent(0x0396);--918

    elseif (player:hasKeyItem(WHISPER_OF_DREAMS)==true) then
		local availRewards = 0
		if (player:hasItem(17599)) then availRewards = availRewards + 1; end -- Diabolos's Pole
		if (player:hasItem(14814)) then availRewards = availRewards + 2; end -- Diabolos's Earring
		if (player:hasItem(15557)) then availRewards = availRewards + 4; end -- Diabolos's Ring
		if (player:hasItem(15516)) then availRewards = availRewards + 8; end -- Diabolos's Torque
		if (player:hasSpell(304)) then availRewards = availRewards + 32; -- Pact
		else availRewards = availRewards + 16 -- Gil
		end	
		player:startEvent(0x0398,17599,14814,15557,15516,0,0,0,availRewards);
		
	-- Blue Ribbon Blues --	
	elseif (BlueRibbonBlues == QUEST_COMPLETED and needZone) then
		player:startEvent(0x016b);--363
	elseif (BlueRibbonBlues == QUEST_ACCEPTED) then
		local blueRibbonProg = player:getVar("BlueRibbonBluesProg");
		if (player:hasItem(12521)) then
			player:startEvent(0x016a);--362
		elseif (blueRibbonProg == 2 and needZone == false) then
			local timerDay = player:getVar("BlueRibbonBluesTimer_Day");
			local currentDay = VanadielDayOfTheYear();
			
			if (player:getVar("BlueRibbonBluesTimer_Year") < VanadielYear()) then
				player:startEvent(0x0168); --  go to the grave  360
			elseif (timerDay + 1 == VanadielDayOfTheYear() and player:getVar("BlueRibbonBluesTimer_Hour") <= VanadielHour()) then
				player:startEvent(0x0168); --  go to the grave  360
			elseif (timerDay + 2 <=  VanadielDayOfTheYear()) then
				player:startEvent(0x0168); --  go to the grave  360
			else
				player:startEvent(0x0167); -- Thanks for the ribbon 359
			end
			
		elseif (blueRibbonProg == 3) then
			if (player:hasItem(13569)) then
				player:startEvent(0x0169,0,13569); -- remidner, go to the grave
			else
				player:startEvent(0x016e,0,13569); -- lost the ribbon
			end
		elseif (blueRibbonProg == 4) then
			player:startEvent(0x016e,0,13569); 
		else
			player:startEvent(0x0132); -- Standard Conversation 
		end
	elseif (BlueRibbonBlues == QUEST_AVAILABLE and player:getQuestStatus(WINDURST,WATER_WAY_TO_GO) == QUEST_COMPLETED and player:getFameLevel(WINDURST) >= 5) then
		player:startEvent(0x0165);
		
	-- Food for Thought --
	elseif (FoodForThought == QUEST_AVAILABLE) then
		if (OhbiruFood == 1 and KerutotoFood ~= 256) then -- Player knows the researchers are hungry and quest not refused
			player:startEvent(0x0139,0,4371); -- Offered Quest 1 (Including Order ifYES)
		elseif (OhbiruFood == 1 and KerutotoFood == 256) then -- Player knows the researchers are hungry and quest refused previously
			player:startEvent(0x013a,0,4371); -- Offered Quest 2 (Including Order ifYES)
		else
			player:startEvent(0x0138); -- Before Quest: Asks you to check on others.
		end
	elseif (FoodForThought == QUEST_ACCEPTED) then
		if (KerutotoFood == 1)  then
			player:startEvent(0x013b,0,4371); -- Repeats Order
		elseif (KerutotoFood == 3) then	
			player:startEvent(0x014d); -- Reminder to check with the others if this NPC has already been fed
		end
	elseif (FoodForThought == QUEST_COMPLETED and needZone) then
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
    if (csid == 0x036c) then
	    player:setVar("COP_Ulmia_s_Path",4);
	elseif ((csid == 0x0139 and option == 0) or (csid == 0x013a and option == 0)) then
		player:addQuest(WINDURST,FOOD_FOR_THOUGHT);
		player:setVar("Kerutoto_Food_var",1);
	elseif (csid == 0x0139 and option == 1) then
		player:setVar("Kerutoto_Food_var",256);
	elseif (csid == 0x014c) then
		if (player:getVar("Kerutoto_Food_var") == 2 and player:getVar("Kenapa_Food_var") == 4 and player:getVar("Ohbiru_Food_var") == 3) then -- If this is the last NPC to be fed
			player:addGil(GIL_RATE*440);
			player:tradeComplete();
			player:addTitle(FAST_FOOD_DELIVERER);
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
	elseif (csid == 0x0165) then
		player:addQuest(WINDURST,BLUE_RIBBON_BLUES);
	elseif (csid == 0x0166 or csid == 0x016d) then
		player:tradeComplete();
		player:setVar("BlueRibbonBluesProg",2);
		player:setVar("BlueRibbonBluesTimer_Hour",VanadielHour()); 
		player:setVar("BlueRibbonBluesTimer_Year",VanadielYear()); 
		player:setVar("BlueRibbonBluesTimer_Day",VanadielDayOfTheYear());
		player:needToZone(true);
		if (csid == 0x0166) then
			player:addGil(GIL_RATE*3600);
		end
	elseif (csid == 0x0168) then
		if (player:getFreeSlotsCount() >= 1) then
			player:setVar("BlueRibbonBluesProg",3);
			player:setVar("BlueRibbonBluesTimer_Hour",0); 
			player:setVar("BlueRibbonBluesTimer_Year",0); 
			player:setVar("BlueRibbonBluesTimer_Day",0);	
			player:addItem(13569);
			player:messageSpecial(ITEM_OBTAINED,13569);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13569);
		end
	elseif (csid == 0x016a) then
		player:completeQuest(WINDURST,BLUE_RIBBON_BLUES);
		player:setVar("BlueRibbonBluesProg",0);
		player:addFame(WINDURST,WIN_FAME*140);
		player:addTitle(GHOSTIE_BUSTER);
		player:needToZone(true);
	elseif (csid == 0x0396) then	--diablos start
	   	    player:addKeyItem(VIAL_OF_DREAM_INCENSE);
			player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_DREAM_INCENSE); 
	elseif (csid == 0x0398) then	--diablos reward
	local item = 0;
	local addspell = 0;
		if (option == 1 and player:hasItem(17599)==false) then item = 17599;--diaboloss-pole 	
		
		elseif (option == 2 and player:hasItem(14814)==false) then item = 14814;--diaboloss-earring 
		
		elseif (option == 3 and player:hasItem(15557)==false) then item = 15557;--diaboloss-ring  
		
		elseif (option == 4 and player:hasItem(15516)==false) then item = 15516;--diaboloss-torque
		

		elseif (option == 5) then 
				player:addGil(GIL_RATE*15000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*15000); -- Gil
				player:delKeyItem(WHISPER_OF_DREAMS);
			    player:setVar("Darkness_Named_date", os.date("%j")); -- %M for next minute, %j for next day
			    player:completeQuest(WINDURST,WAKING_DREAMS);	
				
	    elseif (option == 6 and player:hasSpell(304)==false) then 
				player:addSpell(304); -- diabolos Spell
				player:messageSpecial(DIABOLOS_UNLOCKED,0,0,0);
				addspell=1;
		end
		if (addspell==1) then
			player:delKeyItem(WHISPER_OF_DREAMS);
			player:setVar("Darkness_Named_date", os.date("%j")); -- %M for next minute, %j for next day
			player:completeQuest(WINDURST,WAKING_DREAMS);				
		 elseif (item > 0 and player:getFreeSlotsCount()~=0) then 
			player:delKeyItem(WHISPER_OF_DREAMS);
			player:setVar("Darkness_Named_date", os.date("%j")); -- %M for next minute, %j for next day
			player:completeQuest(WINDURST,WAKING_DREAMS);
		    player:addItem(item);
		    player:messageSpecial(ITEM_OBTAINED,item); -- Item
		 elseif ( option ~= 5 and  (( item == 0 and  addspell==0 ) or (item > 0 and player:getFreeSlotsCount()==0) ) ) then		
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		end
		elseif (csid == 0x02E0) then
			player:setVar("MissionStatus",2);
		
	end
	
end;