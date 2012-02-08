-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Thierride
-- Quest NPC
-- @zone 232
-- @pos -67 -5 -28
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT) == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		carta = trade:hasItemQty(4358, 5);
		if (carta and count == 5) then
			player:startEvent(0x0319);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	conejo = player:getQuestStatus(SANDORIA, A_TASTE_FOR_MEAT);
	if (conejo == QUEST_AVAILABLE) then
		player:startEvent(0x0318);
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
	if (csid == 0x0318) then
		player:addQuest(SANDORIA, A_TASTE_FOR_MEAT);
	elseif (csid == 0x0319) then
		player:tradeComplete();
		player:addFame(SANDORIA, SAN_FAME*30);
		player:addGil(GIL_RATE*150);
		player:messageSpecial(6404, GIL_RATE*150);
		player:completeQuest(SANDORIA, A_TASTE_FOR_MEAT);
	end
end;
