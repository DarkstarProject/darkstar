-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Chalvatot
-- Finish Mission "The Crystal Spring"
-- Start & Finishes Quests: Her Majesty's Garden
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- @pos -105 0.1 72 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
		if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
			player:messageSpecial(FLYER_REFUSED);
		end
	elseif (trade:hasItemQty(533,1) and trade:getItemCount() == 1) then
		if (player:getQuestStatus(SANDORIA,HER_MAJESTY_S_GARDEN) == QUEST_ACCEPTED) then
			player:startEvent(0x0053);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local herMajestysGarden = player:getQuestStatus(SANDORIA,HER_MAJESTY_S_GARDEN);
	local currentMission = player:getCurrentMission(SANDORIA);
	local MissionStatus = player:getVar("MissionStatus");
	local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);
	local WildcatSandy = player:getVar("WildcatSandy");
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,19) == false) then
		player:startEvent(0x0231);
	elseif (player:getCurrentMission(SANDORIA) == THE_CRYSTAL_SPRING and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x022c);
	elseif (herMajestysGarden == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 4) then
		player:startEvent(0x0054);
	elseif (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 4 and player:hasKeyItem(DREAMROSE)) then
	    player:startEvent(0x006f);
	elseif (herMajestysGarden == QUEST_ACCEPTED) then
		player:startEvent(0x0052);
	elseif (circleOfTime == QUEST_ACCEPTED) then
		if (player:getVar("circleTime") == 5) then
			player:startEvent(0x0063);
		elseif (player:getVar("circleTime") == 6) then
			player:startEvent(0x0062);
		elseif (player:getVar("circleTime") == 7) then
			player:startEvent(0x0061);
		elseif (player:getVar("circleTime") == 9) then
			player:startEvent(0x0060);
		end
	else
		player:startEvent(0x0213);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x022c or csid == 0x006f) then
		finishMissionTimeline(player,3,csid,option);
	elseif (csid == 0x0231) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",19,true);
	elseif (csid == 0x0054 and option == 1) then
		player:addQuest(SANDORIA,HER_MAJESTY_S_GARDEN);
	elseif (csid == 0x0053) then
		player:tradeComplete();
		player:addKeyItem(MAP_OF_THE_NORTHLANDS_AREA);
		player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_NORTHLANDS_AREA);
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(SANDORIA,HER_MAJESTY_S_GARDEN);
	elseif (csid == 0x0063) then
		if (option == 1) then
			player:setVar("circleTime",7);
			player:addKeyItem(MOON_RING);
			player:messageSpecial(KEYITEM_OBTAINED,MOON_RING);
		else
			player:setVar("circleTime",6);
		end
	elseif (csid == 0x0062) then
		if (option == 1) then
			player:setVar("circleTime",7);
			player:addKeyItem(MOON_RING);
			player:messageSpecial(KEYITEM_OBTAINED,MOON_RING);
		end
	elseif (csid == 0x0060) then
		if (player:getFreeSlotsCount() ~= 0) then
			player:addItem(12647);
			player:messageSpecial(ITEM_OBTAINED,12647)
			player:completeQuest(JEUNO,THE_CIRCLE_OF_TIME);
			player:addTitle(PARAGON_OF_BARD_EXCELLENCE);
			player:setVar("circleTime",0);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED);
		end
	end

end;
