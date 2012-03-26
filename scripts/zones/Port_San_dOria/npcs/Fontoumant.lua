-----------------------------------
-- Area: Port San d'Oria
-- NPC:  Fontoumant
-- Starts Quest: The Brugaire Consortium
-- Involved in Quests: Riding on the Clouds
-- @zone 232
-- @pos -44 31 174
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 6) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_1",0);
			player:tradeComplete();
			player:addKeyItem(SCOWLING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SCOWLING_STONE);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	TheBrugaireConsortium = player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM);

	if(TheBrugaireConsortium == QUEST_AVAILABLE) then
		player:startEvent(0x01fd);
	elseif(TheBrugaireConsortium == QUEST_ACCEPTED) then
	
		questState = player:getVar("TheBrugaireConsortium-Parcels");
		
		if(questState == 11) then
			player:startEvent(0x01ff);
		elseif(questState == 21) then
			player:startEvent(0x0200);
		elseif(questState == 31) then
			player:startEvent(0x0203);
		end
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

	if(csid == 0x01fd and option == 0) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x0251);
			player:messageSpecial(ITEM_OBTAINED,0x0251);
			player:addQuest(SANDORIA,THE_BRUGAIRE_CONSORTIUM)
			player:setVar("TheBrugaireConsortium-Parcels",10)
		else
			player:startEvent(0x0219);
		end
	elseif(csid == 0x01ff) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x0252);
			player:messageSpecial(ITEM_OBTAINED,0x0252);
			player:setVar("TheBrugaireConsortium-Parcels",20);
		else
			player:startEvent(0x0219);
		end
	elseif(csid == 0x0200) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x0253);
			player:messageSpecial(ITEM_OBTAINED,0x0253);
			player:setVar("TheBrugaireConsortium-Parcels",30);
		else
			player:startEvent(0x0219);
		end
	elseif(csid == 0x0203) then
		if(player:getFreeSlotsCount() ~= 0)then
			player:addItem(0x3001);
			player:messageSpecial(ITEM_OBTAINED,0x3001);
			player:setTitle(COURIER_EXTRAORDINAIRE);
			player:completeQuest(SANDORIA,THE_BRUGAIRE_CONSORTIUM);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:setVar("TheBrugaireConsortium-Parcels",0);
		else
			player:startEvent(0x0219);
		end
	end

end;