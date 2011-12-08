-----------------------------------
-- Area: Upper Jeuno
-- NPC: Rouliette 
-- Starts and Finishes Quest: Candle-making
-- @zone 244 
-- @pos -24 -2 11
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(JEUNO,CANDLE_MAKING) == QUEST_ACCEPTED and trade:hasItemQty(531,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		player:startEvent(0x0025);
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 

		--	player:delQuest(JEUNO,CANDLE_MAKING);


	CandleMaking = player:getQuestStatus(JEUNO,CANDLE_MAKING);
	if(CandleMaking == QUEST_ACCEPTED or (CandleMaking == QUEST_AVAILABLE and(player:getFameLevel(WINDURST) + player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK))/3 >= 4)) then 	
		player:startEvent(0x0024);  -- Start Quest Candle-making
	else
		player:startEvent(0x001e);  --Standard dialog
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
	if(csid == 0x0024 and player:getQuestStatus(JEUNO,CANDLE_MAKING) == QUEST_AVAILABLE) then 
		player:addQuest(JEUNO,CANDLE_MAKING);
	elseif(csid == 0x0025) then 
		player:completeQuest(JEUNO,CANDLE_MAKING);
		player:setTitle(BELIEVER_OF_ALTANA);
		player:addKeyItem(HOLY_CANDLE);
		player:messageSpecial(KEYITEM_OBTAINED,HOLY_CANDLE);
		player:needToZone(true);
		player:addFame(WINDURST, WIN_FAME*10);
		player:addFame(SANORIA, SAN_FAME*10);
		player:addFame(BASTOK, BAS_FAME*10);
		player:tradeComplete(trade);
	end
end;

