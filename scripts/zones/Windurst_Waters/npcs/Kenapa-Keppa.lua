-----------------------------------
--	Area: Windurst Waters
--	NPC:  Kenapa Keppa
--	Involved in Quest: Food For Thought, Hat in Hand
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
	foodstatus = player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT);
	if (foodstatus == 1) then
		prog = player:getVar("QuestFoodForThought_var");
		count = trade:getItemCount();
		gil = trade:getGil();
		if (trade:hasItemQty(4409,1) == false) then -- Traded in wrong item. Not accepted.
			player:startEvent(0x0149);
		elseif (count == 1 and trade:hasItemQty(4409,1) == true and gil == 0 and testflag(tonumber(prog),64) == false) then -- Traded item without receiving order
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x014b);
			else
				player:startEvent(0x014a,120);
			end
		elseif (trade:hasItemQty(4409,1) == true and testflag(tonumber(prog),64) == true) then	-- Traded item
			player:startEvent(0x0147,120);
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
	hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
	if (hatstatus == 1 and testflag(tonumber(player:getVar("QuestHatInHand_var")),4) == false) then
		player:startEvent(0x0038); -- Show Off Hat
	elseif (foodstatus == 0) then
		prog = player:getVar("QuestFoodForThought_var"); 
		if (testflag(tonumber(prog),2) == false) then 
			player:startEvent(0x0136); -- Hungry script
			player:setVar("QuestFoodForThought_var",prog+2);
		else
			player:startEvent(0x0136); -- Hungry script
		end
	elseif (foodstatus == 1) then
		prog = player:getVar("QuestFoodForThought_var"); 
		if (testflag(tonumber(prog),16) == false) then 
			player:startEvent(0x013e); -- Stammer 1/3
			player:setVar("QuestFoodForThought_var",prog+16);
		elseif (testflag(tonumber(prog),32) == false) then 
			player:startEvent(0x013f); -- Stammer 2/3
			player:setVar("QuestFoodForThought_var",prog+32);
		elseif (testflag(tonumber(prog),64) == false) then 
			player:startEvent(0x0140,0,4409); -- Gives Order
			player:setVar("QuestFoodForThought_var",prog+64);
		else
			rand = math.random(1,3);
			if (rand == 1) then
				player:startEvent(0x0140,0,4409); -- Repeats Order
			elseif (rand == 2) then
				player:startEvent(0x0141); -- "Or Whatever"
			else
				player:startEvent(0x0148); -- "..<Grin>.."
			end
		end
	else
		player:startEvent(0x0136); -- Standard converstation
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
		player:addGil(GIL_RATE*120);
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+128);
		player:tradeComplete(trade);
	elseif  (csid == 0x014b) then
		player:addGil(GIL_RATE*120);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*120);		
		prog = player:getVar("QuestFoodForThought_var");
		player:setVar("QuestFoodForThought_var",prog+128);
		player:tradeComplete(trade);
	elseif  (csid == 0x0038) then  -- Show Off Hat
		player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+4);
		player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);		
	end
end;



