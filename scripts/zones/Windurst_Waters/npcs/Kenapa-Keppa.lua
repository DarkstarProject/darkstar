-----------------------------------
--	Area: Windurst Waters
--	NPC:  Kenapa Keppa
--	Involved in Quest: Food For Thought, Hat in Hand
--	Working 100%
--  @zone = 238
--  @pos = 27 -6 -199
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
	KenapaFood = player:getVar("Kenapa_Food_var"); -- Variable to track progress of Kenapa-Keppa in Food for Thought
	
	if (FoodForThought == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		gil = trade:getGil();
		if (trade:hasItemQty(4409,1) == false) then -- Traded in wrong item. Not accepted.
			player:startEvent(0x0149);
		elseif (count == 1 and trade:hasItemQty(4409,1) == true and gil == 0 and KenapaFood == 0) then -- Traded item without receiving order
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x014b);
			else
				player:startEvent(0x014a,120);
			end
		elseif (count == 1 and trade:hasItemQty(4409,1) == true and gil == 0 and KenapaFood == 3) then	-- Traded item after receiving order
			player:startEvent(0x0147,120);
		end
	end
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	FoodForThought = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
	KenapaFood = player:getVar("Kenapa_Food_var"); -- Variable to track progress of Kenapa-Keppa in Food for Thought
	
	if ((hatstatus == 1 or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),4) == false) then
		player:startEvent(0x0038); -- Show Off Hat
	elseif (FoodForThought == QUEST_AVAILABLE) then
		player:startEvent(0x0136); -- Hungry script
	elseif (FoodForThought == QUEST_ACCEPTED) then
		if (KenapaFood == 0) then 
			player:startEvent(0x013e); -- Stammer 1/3
			player:setVar("Kenapa_Food_var",1);
		elseif (KenapaFood == 1) then 
			player:startEvent(0x013f); -- Stammer 2/3
			player:setVar("Kenapa_Food_var",2);
		elseif (KenapaFood == 2) then 
			player:startEvent(0x0140,0,4409); -- Gives Order
			player:setVar("Kenapa_Food_var",3);
		elseif (FoodForThought == QUEST_ACCEPTED and KenapaFood == 3) then
			rand = math.random(1,3);
			if (rand == 1) then
				player:startEvent(0x0140,0,4409); -- Repeats Order
			elseif (rand == 2) then
				player:startEvent(0x0141); -- "Or Whatever"
			else
				player:startEvent(0x0148); -- "..<Grin>.."
			end
		elseif(FoodForThought == QUEST_ACCEPTED and KenapaFood == 4) then -- Give standard conversation options if this NPC has been fed but others haven't
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x012e); -- Standard converstation
			else
				player:startEvent(0x012f); -- Standard converstation
			end
		end
	else
		rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(0x012e); -- Standard converstation
		else
			player:startEvent(0x012f); -- Standard converstation
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
	if (csid == 0x0147 or csid == 0x014a) then
		if(player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 3 and player:getVar("Ohbiru_Food_var") == 3) then -- If this is the last NPC to be fed
			player:addGil(GIL_RATE*120);
			player:tradeComplete();
			player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
			player:setTitle(FAST_FOOD_DELIVERER);
			player:addFame(WINDURST,WIN_FAME*100);
			player:needToZone(true);
			player:setVar("Kerutoto_Food_var",0);		-- ------------------------------------------
			player:setVar("Kenapa_Food_var",0);			-- Erase all the variables used in this quest
			player:setVar("Ohbiru_Food_var",0);			-- ------------------------------------------
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*120);
			player:setVar("Kenapa_Food_var",4); -- If this is NOT the last NPC given food, flag this NPC as completed.
		end
	elseif(csid == 0x014b) then
		if(player:getVar("Kerutoto_Food_var") == 3 and player:getVar("Kenapa_Food_var") == 3 and player:getVar("Ohbiru_Food_var") == 3) then -- If this is the last NPC to be fed
			player:addGil(GIL_RATE*120);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*120); 
			player:tradeComplete();
			player:completeQuest(WINDURST,FOOD_FOR_THOUGHT);
			player:setTitle(FAST_FOOD_DELIVERER);
			player:addFame(WINDURST,WIN_FAME*100);
			player:needToZone(true);
			player:setVar("Kerutoto_Food_var",0);		-- ------------------------------------------
			player:setVar("Kenapa_Food_var",0);			-- Erase all the variables used in this quest
			player:setVar("Ohbiru_Food_var",0);			-- ------------------------------------------
		else
			player:tradeComplete();
			player:addGil(GIL_RATE*120);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*120);
			player:setVar("Kenapa_Food_var",4); -- If this is NOT the last NPC given food, flag this NPC as completed.
		end
	elseif  (csid == 0x0038) then  -- Show Off Hat
		player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+4);
		player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);		
	end
end;



