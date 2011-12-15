-----------------------------------
-- Area: Lower Jeuno
-- NPC: Sattal-Mansal
-- Starts and Finishes Quest: Mysteries of Beadeaux I & II
-- @zone 245
-- @pos 40 3 -53
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(JEUNO,MYSTERIES_OF_BEADEAUX_I) == QUEST_ACCEPTED and trade:hasItemQty(495,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		player:startEvent(0x005B); -- Ending quest Mysteries I
	elseif(player:getQuestStatus(JEUNO,MYSTERIES_OF_BEADEAUX_II) == QUEST_ACCEPTED and trade:hasItemQty(494,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		player:startEvent(0x005C); -- Ending quest Mysteries II
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getQuestStatus(JEUNO,MYSTERIES_OF_BEADEAUX_I) == QUEST_AVAILABLE and player:hasKeyItem(SILVER_BELL) == true) then --Magicite Mission active (receive this KI after the first CS with aldo)
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
	if(csid == 0x0059) then 
		player:addQuest(JEUNO,MYSTERIES_OF_BEADEAUX_I);
		player:addQuest(JEUNO,MYSTERIES_OF_BEADEAUX_II);
	elseif(csid == 0x005B) then
		player:completeQuest(JEUNO,MYSTERIES_OF_BEADEAUX_I);
		player:addKeyItem(CORUSCANT_ROSARY);
		player:messageSpecial(KEYITEM_OBTAINED,CORUSCANT_ROSARY);
		player:addFame(JEUNO,30);
		player:tradeComplete(trade);
	elseif(csid == 0x005C) then
		player:completeQuest(JEUNO,MYSTERIES_OF_BEADEAUX_II);
		player:addKeyItem(BLACK_MATINEE_NECKLACE);
		player:messageSpecial(KEYITEM_OBTAINED,BLACK_MATINEE_NECKLACE);
		player:addFame(JEUNO,30);
		player:tradeComplete(trade);
	end
end;



