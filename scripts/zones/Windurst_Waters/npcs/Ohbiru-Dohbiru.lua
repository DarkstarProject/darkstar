-----------------------------------
--	Area: Windurst Waters
--	NPC:  Kenapa Keppa
--	Part of Quest Food For Thought
--	Working 100%
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end
	foodstatus = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	if (foodstatus == 1) then
		prog = player:getVar("QuestFoodForThought_var"); 
		count = trade:getItemCount();
		gil = trade:getGil();
		-- Build Quality Variable
		quality = 0;
		if (trade:hasItemQty(4493,1) == true) then quality = quality +1; end
		if (trade:hasItemQty(4408,1) == true) then quality = quality +1; end
		if (trade:hasItemQty(624,1) == true) then  quality = quality +1; end
		-- Main Script
		if (quality > 0  and quality < 3 and gil == 0 and quality == count) then -- Traded less than 3 items
			player:startEvent(0x0143,0,150);
		elseif (testflag(tonumber(prog),8) == false and quality == 3 and gil == 0 and quality == count) then -- Traded all 3 items & Didn't ask for order
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x0145,440);
			else
				player:startEvent(0x0146);
			end
		elseif (testflag(tonumber(prog),8) == true and quality == 3 and gil == 0 and quality == count) then -- Traded all 3 items after receiving order
			player:startEvent(0x0142,440);
		end	
	end
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	foodstatus = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	if (foodstatus <= 1) then
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
	end
	if (foodstatus == 0) then
		rand = math.random(1,2)
		if (rand == 1) then
			player:startEvent(0x0134); -- Hungry 1
		else
			player:startEvent(0x0135); -- Hungry 2
		end		
		if (testflag(tonumber(prog),1) == false) then 
			player:setVar("QuestFoodForThought_var",prog+1);
		end
	elseif (foodstatus == 1 and testflag(tonumber(prog),8) == false and testflag(tonumber(prog),128) == false) then
		player:startEvent(0x013c,0,4493,624,4408); -- Gives Order
		player:setVar("QuestFoodForThought_var",prog+8);
	elseif (foodstatus == 1 and testflag(tonumber(prog),8) == true and testflag(tonumber(prog),128) == false) then
		rand = math.random(1,2)
		if (rand == 1) then
			player:startEvent(0x013d,0,4493,624,4408); -- Repeats Order
		else
			player:startEvent(0x0144); -- Reminds to check on friends
		end
	else
		player:startEvent(0x0158); -- Standard Conversation	
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
	if (csid == 0x0142 or csid == 0x0145)  then
		player:addGil(GIL_RATE*440);
		player:tradeComplete(trade);
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+128);
		player:tradeComplete(trade);
	elseif (csid == 0x0146) then
		player:addGil(GIL_RATE*440);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*440);
		player:tradeComplete(trade);
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+128);		
	elseif (csid == 0x0143) then
		player:addGil(GIL_RATE*150);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
		player:tradeComplete(trade);
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+128);
	end
end;



