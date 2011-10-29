-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Miageau
-- Quest NPC
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
Tomb = player:getQuestStatus(0,11);
if (Tomb == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		trade:hasItemQty(567,1);
		freeSlots = player:getFreeSlotsCount();
		if ( count == 1 and trade:hasItemQty(567,1) == true and freeSlots > 0) then
		player:tradeComplete();
		player:startEvent(0x0003);
		else
			player:messageSpecial(6534, 567);
			end
			end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 
	player:startEvent(0x0002);
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
if (csid == 0x0003) then
player:addItem(547);
player:messageSpecial(6537,547);
end
end;
