-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Hot Springs
-- @Zone: 139
-- @pos  444 -37 -18
-----------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Horlais_Peak/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(OUTLANDS,SECRET_OF_THE_DAMP_SCROLL) == QUEST_ACCEPTED and trade:hasItemQty(1210,1) and trade:getItemCount() == 1) then
		player:startEvent(0x0002,1210);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(SANDORIA,THE_GENERAL_S_SECRET) == 1) and (player:hasKeyItem(CURILLAS_BOTTLE_EMPTY) == true) then
		player:addKeyItem(CURILLAS_BOTTLE_FULL)
		player:messageSpecial(KEYITEM_OBTAINED,CURILLAS_BOTTLE_FULL);
		player:delKeyItem(CURILLAS_BOTTLE_EMPTY);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
	if (csid == 0x0002) then
		player:tradeComplete();
		player:addItem(4949); -- Scroll of Jubaku: Ichi
		player:messageSpecial(ITEM_OBTAINED, 4949); 
		player:addFame(OUTLANDS,NORG_FAME*75);
		player:addTitle(CRACKER_OF_THE_SECRET_CODE);
		player:completeQuest(OUTLANDS,SECRET_OF_THE_DAMP_SCROLL);
	end
end;