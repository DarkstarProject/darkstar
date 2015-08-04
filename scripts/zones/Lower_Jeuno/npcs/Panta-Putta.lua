-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Panta-Putta
-- Starts and Finishes Quest: The Wonder Magic Set, The kind cardian
-- Involved in Quests: The Lost Cardian
-- @zone 245
-- @pos -61 0 -140
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheWonderMagicSet = player:getQuestStatus(JEUNO,THE_WONDER_MAGIC_SET);
	WonderMagicSetKI = player:hasKeyItem(WONDER_MAGIC_SET);
	TheLostCardianCS = player:getVar("theLostCardianVar");
	TheKindCardian = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);
	
	if (player:getFameLevel(JEUNO) >= 4 and TheWonderMagicSet == QUEST_AVAILABLE) then 
		player:startEvent(0x004D); -- Start quest "The wonder magic set"
	elseif (TheWonderMagicSet == QUEST_ACCEPTED and WonderMagicSetKI == false) then 
		player:startEvent(0x0037); -- During quest "The wonder magic set"
	elseif (WonderMagicSetKI == true) then
		player:startEvent(0x0021); -- Finish quest "The wonder magic set"
	elseif (TheWonderMagicSet == QUEST_COMPLETED and player:getQuestStatus(JEUNO,COOK_S_PRIDE) ~= QUEST_COMPLETED) then 
		player:startEvent(0x0028); -- Standard dialog
	elseif (TheWonderMagicSet == QUEST_COMPLETED and player:getQuestStatus(JEUNO,THE_LOST_CARDIAN) == QUEST_AVAILABLE) then 
		if (TheLostCardianCS >= 1) then 
			player:startEvent(0x001E); -- Second dialog for "The lost cardien" quest
		else
			player:startEvent(0x0028); -- Standard dialog
		end
	elseif (TheKindCardian == QUEST_ACCEPTED and player:getVar("theKindCardianVar") == 2) then
		player:startEvent(0x0023); -- Finish quest "The kind cardien"
	elseif (TheKindCardian == QUEST_COMPLETED) then 
		player:startEvent(0x004C); -- New standard dialog after "The kind cardien"
	else
		player:startEvent(0x004E); -- Base standard dialog
	end
end;

-- 0x004E oh zut j'ai besoin de cette marmite
-- 0x001E j'ai été trop dur avec two... et percé la marmite
-- 0x0028 du moment que j'ai cette boite et la marmite je vais enfin battre ce gars

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
	if (csid == 0x004D and option == 1) then 
		player:addQuest(JEUNO,THE_WONDER_MAGIC_SET);
	elseif (csid == 0x0021) then 
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13328);
		else
			player:addTitle(FOOLS_ERRAND_RUNNER);
			player:delKeyItem(WONDER_MAGIC_SET);
			player:addItem(13328);
			player:messageSpecial(ITEM_OBTAINED,13328);
			player:addFame(JEUNO, JEUNO_FAME*30);
			player:needToZone(true);
			player:completeQuest(JEUNO,THE_WONDER_MAGIC_SET);
		end
	elseif (csid == 0x001E) then 
		player:setVar("theLostCardianVar",2);
	elseif (csid == 0x0023) then 
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13596);
		else
			player:addTitle(BRINGER_OF_BLISS);
			player:delKeyItem(TWO_OF_SWORDS);
			player:setVar("theKindCardianVar",0);
			player:addItem(13596);
			player:messageSpecial(ITEM_OBTAINED,13596); -- Green Cape
			player:addFame(JEUNO, JEUNO_FAME*30);
			player:completeQuest(JEUNO,THE_KIND_CARDIAN);
		end
	end
end;



