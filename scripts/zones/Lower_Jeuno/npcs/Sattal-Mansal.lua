-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Sattal-Mansal
-- Starts and Finishes Quest: Mysteries of Beadeaux I & II
-- @zone 245
-- @pos 40 3 -53
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
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
	if (player:getQuestStatus(JEUNO,MYSTERIES_OF_BEADEAUX_I) == QUEST_ACCEPTED and trade:hasItemQty(495,1) and trade:getItemCount() == 1) then 
		player:startEvent(0x005B); -- Ending quest Mysteries I
	elseif (player:getQuestStatus(JEUNO,MYSTERIES_OF_BEADEAUX_II) == QUEST_ACCEPTED and trade:hasItemQty(494,1) and trade:getItemCount() == 1) then 
		player:startEvent(0x005C); -- Ending quest Mysteries II
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(JEUNO,MYSTERIES_OF_BEADEAUX_I) == QUEST_AVAILABLE and player:hasKeyItem(SILVER_BELL)) then --Magicite Mission active (receive this KI after the first CS with aldo)
		player:startEvent(0x0059); -- Start quests
	else
		player:startEvent(0x0060); -- Standard dialog
	end
end;
--
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
	if (csid == 0x0059) then 
		player:addQuest(JEUNO,MYSTERIES_OF_BEADEAUX_I);
		player:addQuest(JEUNO,MYSTERIES_OF_BEADEAUX_II);
	elseif (csid == 0x005B) then
		player:addKeyItem(CORUSCANT_ROSARY);
		player:messageSpecial(KEYITEM_OBTAINED,CORUSCANT_ROSARY);
		player:addFame(JEUNO,JEUNO_FAME*30);
		player:tradeComplete(trade);
		player:completeQuest(JEUNO,MYSTERIES_OF_BEADEAUX_I);
	elseif (csid == 0x005C) then
		player:addKeyItem(BLACK_MATINEE_NECKLACE);
		player:messageSpecial(KEYITEM_OBTAINED,BLACK_MATINEE_NECKLACE);
		player:addFame(JEUNO,JEUNO_FAME*30);
		player:tradeComplete(trade);
		player:completeQuest(JEUNO,MYSTERIES_OF_BEADEAUX_II);
	end
end;



