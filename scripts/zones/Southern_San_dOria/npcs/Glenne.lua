-------------------------------------
--	Area: Southern San d'Oria
--	NPC: Glenne
--  Starts Quest: A Sentry's Peril
-------------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	elseif (player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL) == 1) then
		count = trade:getItemCount();
		OintmentCase = trade:hasItemQty(601,1);
		if (OintmentCase == true and count == 1) then
			player:tradeComplete();
			player:addItem(12832);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:setTitle(RONFAURIAN_RESCUER);
			player:completeQuest(SANDORIA,A_SENTRY_S_PERIL);
			player:startEvent(0x0201);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

ASentrysPeril = player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL);
	
	if (ASentrysPeril == 0) then
		player:startEvent(0x01fe);
	elseif (ASentrysPeril == 1) then
		if (player:hasItem(600) == true or 
		    player:hasItem(601) == true) then
			player:startEvent(0x0208);
		else
			player:startEvent(0x0284);
		end	
	elseif (ASentrysPeril == 2) then
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

	if (csid == 0x0201) then
		player:messageSpecial(ITEM_OBTAINED,12832);
	elseif (csid == 0x01fe and option == 0) then
		if (player:getFreeSlotsCount() > 0) then
			player:addItem(600);
			player:messageSpecial(ITEM_OBTAINED,600);
			player:addQuest(SANDORIA,A_SENTRY_S_PERIL);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED);
		end 	
	elseif (csid == 0x0284) then
		if(player:getFreeSlotsCount() > 0) then
			player:addItem(600);
			player:messageSpecial(ITEM_OBTAINED,600);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED);
		end
	end
end;