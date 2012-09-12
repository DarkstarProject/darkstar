-----------------------------------
-- Area: Heaven's Tower
-- NPC:  Chumimi
-- Starts and Finishes Quest: The Three Magi, Recollections
-- @pos 0 30 21 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(WINDURST,THE_THREE_MAGI) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(1104,1) and trade:getItemCount() == 1) then -- Trade Glowstone
			player:startEvent(0x010d); -- Finish Quest "The Three Magi"
		end
	elseif(player:getQuestStatus(WINDURST,RECOLLECTIONS) == QUEST_ACCEPTED and player:getVar("recollectionsQuest") < 2) then
		if(trade:hasItemQty(1105,1) and trade:getItemCount() == 1) then
			player:startEvent(0x010F);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	theThreeMagi = player:getQuestStatus(WINDURST,THE_THREE_MAGI);
	recollections = player:getQuestStatus(WINDURST,RECOLLECTIONS);
	
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	
	if(theThreeMagi == QUEST_AVAILABLE and mJob == 4 and mLvl >= AF1_QUEST_LEVEL) then
		player:startEvent(0x0104,0,613,0,0,0,1104); -- Start Quest "The Three Magi" --- NOTE: 5th parameter is "Meteorites" but he doesn't exist ---
	elseif(theThreeMagi == QUEST_ACCEPTED) then
		player:startEvent(0x0105,0,0,0,0,0,1104); -- During Quest "The Three Magi"
	elseif(theThreeMagi == QUEST_COMPLETED and recollections == QUEST_AVAILABLE and (mJob == 4 and mLvl < AF2_QUEST_LEVEL or mJob ~= 4)) then
		player:startEvent(0x010c); -- New standard dialog after "The Three Magi"
	elseif(theThreeMagi == QUEST_COMPLETED and mJob == 4 and mLvl >= AF2_QUEST_LEVEL and player:needToZone() == false and recollections == QUEST_AVAILABLE) then
		player:startEvent(0x010E,0,1105); -- Start Quest "Recollections"
	elseif(recollections == QUEST_ACCEPTED and player:hasKeyItem(FOE_FINDER_MK_I)) then
		player:startEvent(0x0113); -- Finish Quest "Recollections"
	else
		player:startEvent(0x0103); -- Standard dialog
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
	
	if(csid == 0x0104) then
		-- option 3: Koru-Moru -- option 2: Shantotto -- option 1: Yoran-Oran
		player:addQuest(WINDURST,THE_THREE_MAGI);
		player:setVar("theThreeMagiSupport",option);
	elseif(csid == 0x010d) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17423); -- Casting Wand
		else
			choosetitle = player:getVar("theThreeMagiSupport");
			
			if(choosetitle == 3) then
				player:setTitle(PROFESSOR_KORUMORU_SUPPORTER);
			elseif(choosetitle == 2) then
				player:setTitle(DOCTOR_SHANTOTTO_SUPPORTER);
			else
				player:setTitle(DOCTOR_YORANORAN_SUPPORTER);
			end
			
			player:tradeComplete();
			player:addItem(17423);
			player:messageSpecial(ITEM_OBTAINED, 17423); -- Casting Wand
			player:needToZone(true);
			player:setVar("theThreeMagiSupport",0);
			player:addFame(WINDURST,WIN_FAME*AF1_FAME);
			player:completeQuest(WINDURST,THE_THREE_MAGI);
		end
	elseif(csid == 0x010E) then
		player:addQuest(WINDURST,RECOLLECTIONS);
	elseif(csid == 0x010F) then
		player:tradeComplete();
		player:setVar("recollectionsQuest",2);
	elseif(csid == 0x0113) then
		if(player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14092); -- wizards sabots
		else
			player:setVar("recollectionsQuest",0);
			player:delKeyItem(FOE_FINDER_MK_I);
			player:addItem(14092);
			player:messageSpecial(ITEM_OBTAINED,14092); -- wizards sabots
			player:addFame(WINDURST,WIN_FAME*AF2_FAME);
			player:completeQuest(WINDURST,RECOLLECTIONS);
		end
	end

end;