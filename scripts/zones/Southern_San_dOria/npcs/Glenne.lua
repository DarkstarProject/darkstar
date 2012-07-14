-------------------------------------
-- Area: Southern San d'Oria
-- NPC: Glenne
-- Starts and Finishes Quest: A Sentry's Peril
-- @zone 230
-- @pos -122 -2 15
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	
	elseif(player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(601,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0201);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	aSentrysPeril = player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL);
	
	if(aSentrysPeril == QUEST_AVAILABLE) then
		player:startEvent(0x01fe);
	elseif(aSentrysPeril == QUEST_ACCEPTED) then
		if (player:hasItem(600) == true or player:hasItem(601) == true) then
			player:startEvent(0x0208);
		else
			player:startEvent(0x0284);
		end	
	elseif(aSentrysPeril == QUEST_COMPLETED) then
		player:startEvent(0x0209);
	end
	
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

	if (csid == 0x01fe and option == 0) then
		if (player:getFreeSlotsCount() > 0) then
			player:addQuest(SANDORIA,A_SENTRY_S_PERIL);
			player:addItem(600);
			player:messageSpecial(ITEM_OBTAINED,600);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,600); -- Dose of ointment
		end 	
	elseif (csid == 0x0284) then
		if(player:getFreeSlotsCount() > 0) then
			player:addItem(600);
			player:messageSpecial(ITEM_OBTAINED,600);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,600); -- Dose of ointment
		end
	elseif(csid == 0x0201) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12832); -- Bronze Subligar
		else
			player:tradeComplete();
			player:setTitle(RONFAURIAN_RESCUER);
			player:addItem(12832);
			player:messageSpecial(ITEM_OBTAINED,12832); -- Bronze Subligar
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,A_SENTRY_S_PERIL);
		end
	end
	
end;