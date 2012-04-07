-----------------------------------
-- Area: Bostaunieux Obliette
-- NPC:  Novalmauge
-- Starts and Finishes Quest: The Rumor
-- Involved in Quest: The Holy Crest, Trouble at the Sluice
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
	
	if(player:getVar("troubleAtTheSluiceVar") == 2) then
		if(trade:hasItemQty(959,1) and trade:getItemCount() == 1) then -- Trade Dahlia
			player:startEvent(0x0011);
		end
	end
	if(player:getQuestStatus(SANDORIA,THE_RUMOR) == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		BeastBlood = trade:hasItemQty(930,1)
		if(BeastBlood == true and count == 1) then
			player:startEvent(0x000c);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	troubleAtTheSluice = player:getQuestStatus(SANDORIA,TROUBLE_AT_THE_SLUICE);
	TheHolyCrest = player:getVar("TheHolyCrest_Event");
	tatsVar = player:getVar("troubleAtTheSluiceVar");
	theRumor = player:getQuestStatus(SANDORIA,THE_RUMOR);
	
	-- The Holy Crest Quest
	if(TheHolyCrest == 1) then
		player:startEvent(0x0006);
	elseif(TheHolyCrest == 2) then
		player:startEvent(0x0007);
	-- Trouble at the Sluice Quest
	elseif(tatsVar == 1) then
		player:startEvent(0x000f);
		player:setVar("troubleAtTheSluiceVar",2);
	elseif(tatsVar == 2) then
		player:startEvent(0x0010);
	-- The rumor Quest
	elseif(theRumor == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3 and player:getMainLvl() >= 10) then
		player:startEvent(0x000d);
	elseif(theRumor == QUEST_ACCEPTED) then
		player:startEvent(0x000b);
	elseif(theRumor == QUEST_COMPLETED) then
		player:startEvent(0x000e); -- Standard dialog after "The Rumor"
	else
		player:startEvent(0x000a); -- Standard dialog
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
	
	if(csid == 0x0006) then
		player:setVar("TheHolyCrest_Event",2);
	elseif(csid == 0x0011) then
		player:tradeComplete();
		player:addKeyItem(NEUTRALIZER);
		player:messageSpecial(KEYITEM_OBTAINED,NEUTRALIZER);
		player:setVar("troubleAtTheSluiceVar",0);
	elseif(csid == 0x000d and option == 1) then
		player:addQuest(SANDORIA,THE_RUMOR);			
	elseif(csid == 0x000c) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4853); -- Scroll of Drain
		else
			player:tradeComplete();
			player:addItem(4853);
			player:messageSpecial(ITEM_OBTAINED, 4853); -- Scroll of Drain

			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,THE_RUMOR);
		end
	end
	
end;