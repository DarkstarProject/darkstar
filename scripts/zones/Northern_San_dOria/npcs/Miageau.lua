-----------------------------------
--  Area: Northern San d'Oria
--   NPC: Miageau
--  Type: Quest Giver NPC
-- @zone: 231
--  @pos 115 0 108
--
-- Starts and Finishes: Waters of Cheval
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if (player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL) == QUEST_ACCEPTED) then
		if (trade:getItemCount() == 1 and trade:hasItemQty(603, 1)) then
			player:startEvent(0x0203);
		end;
	end;
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	watersOfTheCheval = player:getQuestStatus(SANDORIA,WATER_OF_THE_CHEVAL);
	if (watersOfTheCheval == QUEST_ACCEPTED) then
		if (player:hasItem(602) == true) then
			player:startEvent(0x0200);
		else
			player:startEvent(0x0207);
		end;
	elseif (watersOfTheCheval == QUEST_AVAILABLE) then
		player:startEvent(0x01f8);
	else
		player:startEvent(0x0205);
	end;
	
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

	if (csid == 0x0203) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 13183);
		else
			player:tradeComplete();
			player:addItem(13183);
			player:messageSpecial(ITEM_OBTAINED, 13183);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:addTitle(THE_PURE_ONE);
			player:completeQuest(SANDORIA,WATER_OF_THE_CHEVAL);
		end;
	elseif (csid == 0x01f8) then
		player:addQuest(SANDORIA, WATER_OF_THE_CHEVAL);
	end;
	
end;
