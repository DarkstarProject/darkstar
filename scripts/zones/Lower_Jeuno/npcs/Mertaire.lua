-----------------------------------
-- Area: Lower Jeuno
-- NPC: Mertaire
-- Starts and Finishes Quest: The Old Monument (start only), A Minstrel in Despair, Painful Memory (BARD AF1)
-- @zone 245
-- @pos -17 0 -61
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(JEUNO, THE_OLD_MONUMENT) == QUEST_COMPLETED) then
		count = trade:getItemCount();
		gil = trade:getGil();
		
		if (trade:hasItemQty(POETIC_PARCHMENT,1) == true and count == 1 and gil == 0) then
			player:startEvent(0x0065);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getMainJob() ~= 10 and player:getMainLvl() >= 30) then
		if (player:getVar("TheOldMonument_Event") == 0 and player:getQuestStatus(JEUNO,THE_OLD_MONUMENT) == QUEST_AVAILABLE) then
			player:startEvent(0x0066);
		end
	elseif(player:getMainJob() == 10 and player:getMainLvl() >= 40 and player:hasKeyItem(228) == false) then 
		if(player:getVar("PainfulMemoryCS") == 0) then 
			player:startEvent(0x008a); -- Long dialog for "Painful Memory"
		else
			player:startEvent(0x0089); -- Short dialog for "Painful Memory"
		end
	elseif(player:hasKeyItem(228) == true) then 
		player:startEvent(0x0088); -- During Quest "Painful Memory"
	elseif(player:getQuestStatus(JEUNO,PAINFUL_MEMORY) == QUEST_COMPLETED) then 
		player:startEvent(0x0087); -- Standard dialog after completed "Painful Memory"
	end
end; 

-- 0x0066  0x0065  0x0067  0x008a  0x0089  0x0088  0x0087  0x008b  0x276e

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

	if (csid == 0x0066 and option == 0) then
		player:setVar("TheOldMonument_Event",1);
	elseif (csid == 0x0065) then
		player:addGil(GIL_RATE*2100);
		player:messageSpecial(GIL_OBTAINED, GIL_RATE*2100);
		player:addFame(JEUNO,30);
		player:tradeComplete();
		player:completeQuest(JEUNO,A_MINSTREL_IN_DESPAIR);
	elseif(csid == 0x008a and option == 1 or csid == 0x0089 and option == 1) then 
		player:addQuest(JEUNO,PAINFUL_MEMORY);
		player:setVar("PainfulMemoryCS",0);
		player:addKeyItem(MERTAIRES_BRACELET);
		player:messageSpecial(KEYITEM_OBTAINED,MERTAIRES_BRACELET); -- Mertaire's Bracelet (key item).
	elseif(csid == 0x008a and option == 0) then 
		player:setVar("PainfulMemoryCS",1);
	end
end;

