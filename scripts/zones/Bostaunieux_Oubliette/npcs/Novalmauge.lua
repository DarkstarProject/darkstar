-----------------------------------
-- Area: Bostaunieux Obliette
-- NPC:  Novalmauge
-- Starts and Finishes Quest: The Rumor
-- Involved in Quest: The Holy Crest and Trouble at the Sluice
-- @zone 167
-- @pos 70 -24 21
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	FlorVar= player:getVar("QuestFlorVar");
	
	if(FlorVar == 2 or FlorVar == 3) then
		if(trade:hasItemQty(959,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0011);
		end
	end
	
	if(player:getQuestStatus(SANDORIA,THE_RUMOR) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(930,1) and trade:getItemCount() == 1) then
			player:startEvent(0x000c);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	theRumor = player:getQuestStatus(SANDORIA,THE_RUMOR);
	TheHolyCrest = player:getVar("TheHolyCrest_Event");
	FlorVar= player:getVar("QuestFlorVar");
	
	if(TheHolyCrest == 1) then
		player:startEvent(0x0006);
	elseif(TheHolyCrest == 2) then
		player:startEvent(0x0007);
	elseif(FlorVar == 1) then
		player:startEvent(0x000f);
		NewFlorVar = FlorVar + 1;
		player:setVar("QuestFlorVar",NewFlorVar);
	elseif(FlorVar == 2) then
		player:startEvent(0x0010);
	elseif(theRumor == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
		player:startEvent(0x000d);
	elseif(theRumor == QUEST_ACCEPTED) then
		player:startEvent(0x000b);
	else
		player:startEvent(0x000a);
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

	FlorVar= player:getVar("QuestFlorVar")
	
	if(csid == 0x0006) then
		player:setVar("TheHolyCrest_Event",2);
	end
	if(csid == 0x0011) then
		player:tradeComplete();
		player:addKeyItem(NEUTRALIZER);
		player:messageSpecial(KEYITEM_OBTAINED,NEUTRALIZER);
		player:setVar("QuestFlorVar",FlorVar + 1);
	end
	if(csid == 0x000d and option == 1) then
		player:addQuest(SANDORIA,THE_RUMOR);			
	elseif(csid == 0x000c) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4853); -- Scroll of Drain
		else
			player:tradeComplete();
			player:addItem(4853);
			player:messageSpecial(ITEM_OBTAINED, 4853); -- Scroll of Drain
			player:setVar("sharpeningTheSwordCS",0);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,THE_RUMOR);
		end
	end
	
end;