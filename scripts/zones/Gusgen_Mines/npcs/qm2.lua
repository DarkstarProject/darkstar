-----------------------------------
-- Area: Gusgen Mines
-- NPC:  qm2 (???)
-- Involved In Mission: Bastok 3-2
-- @pos 206 -60 -101 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Gusgen_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getCurrentMission(BASTOK) == TO_THE_FORSAKEN_MINES and player:hasItem(563) == false) then
		if (trade:hasItemQty(4358,1) and trade:getItemCount() == 1) then -- Trade Hare Meat
			player:tradeComplete();
			SpawnMob(17580038,300):updateClaim(player);
		end
	end
	if (player:getQuestStatus(BASTOK, BLADE_OF_DEATH) == QUEST_ACCEPTED and player:getVar("ChaosbringerKills") >= 200) then
		if (trade:hasItemQty(16607,1) and trade:getItemCount() == 1) then -- Trade Chaosbringer
			player:tradeComplete();
			player:startEvent(0x000a);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x000a) then
		if (player:getFreeSlotsCount() > 0) then	
			player:addItem(16637);
			player:addTitle(BLACK_DEATH);
			player:setVar("ChaosbringerKills", 0);
			player:messageSpecial(ITEM_OBTAINED,16637);
			player:delKeyItem(LETTER_FROM_ZEID);
			player:completeQuest(BASTOK,BLADE_OF_DEATH);
		else	
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16637);
		end
	end
	
end;