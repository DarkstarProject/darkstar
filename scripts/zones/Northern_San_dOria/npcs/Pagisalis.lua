-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Pagisalis
-- Involved In Quest: Enveloped in Darkness
-- @zone 231
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(SANDORIA,UNDYING_FLAMES) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(913,2) and trade:getItemCount() == 2) then -- Trade Lump of Beeswax
			player:startEvent(0x0233);
		end
	end
			
	if (player:hasKeyItem(OLD_POCKET_WATCH) and player:hasKeyItem(OLD_BOOTS) == false) then 
		if (trade:hasItemQty(828,1) and trade:getItemCount() == 1) then -- Trade Velvet Cloth
			player:startEvent(0x0025);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	sanFame = player:getFameLevel(SANDORIA);
	undyingFlames = player:getQuestStatus(SANDORIA,UNDYING_FLAMES);
	if (player:hasKeyItem(OLD_POCKET_WATCH)) then
		player:startEvent(0x0030);
	elseif (player:hasKeyItem(OLD_BOOTS)) then
		player:startEvent(0x003A);
	elseif (sanFame >= 2 and undyingFlames == QUEST_AVAILABLE) then
		player:startEvent(0x0232);
	elseif (undyingFlames == QUEST_ACCEPTED) then
		player:startEvent(0x0235);
	elseif (undyingFlames == QUEST_COMPLETED) then
		player:startEvent(0x0236);
	else
		player:startEvent(0x0234)
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

	if (csid == 0x0232 and option == 0) then
		player:addQuest(SANDORIA,UNDYING_FLAMES);
	elseif (csid == 0x0233) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13211); -- Friars Rope
		else
			player:tradeComplete();
			player:addTitle(FAITH_LIKE_A_CANDLE);
			player:addItem(13211);
			player:messageSpecial(ITEM_OBTAINED,13211); -- Friars Rope
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,UNDYING_FLAMES);
		end
	elseif (csid == 0x0025) then
		player:tradeComplete();
		player:delKeyItem(OLD_POCKET_WATCH);
		player:addKeyItem(OLD_BOOTS);
		player:messageSpecial(KEYITEM_OBTAINED,OLD_BOOTS);
	end
	
end;