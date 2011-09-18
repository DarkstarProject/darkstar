-----------------------------------
-- Area: Bastok Markets
-- NPC: Nbu Latteh
-- Starts & Finishes Quest: Mom, The Adventurer?
-- Starts Quest: The Signpost Marks the Spot
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	pFame = player:getFameLevel(BASTOK);

	if (pFame < 2) then
		MomTheAdventurer = player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER);
		questStatus = player:getVar("MomTheAdventurer_Event");
		zoneStatus = player:needToZone();
		itemSeen = player:seenKeyItem(LETTER_FROM_ROH_LATTEH);

		if (MomTheAdventurer ~= 2 and questStatus ~= 2) then
			if (MomTheAdventurer == 0) then
				player:addQuest(BASTOK,MOM_THE_ADVENTURER);
			end
			player:startEvent(0x00e6);
		elseif (MomTheAdventurer >= 1 and questStatus == 2) then
			if (itemSeen == true) then
				player:startEvent(0x00ea);
				player:setVar("MomTheAdventurer_KeyItem",1)
			else
				player:startEvent(0x00e9);
			end
		elseif (MomTheAdventurer == 2 and questStatus == 3) then
			if (zoneStatus) then
				player:startEvent(0x007f);
			else
				player:startEvent(0x00e6);
			end
		end
	elseif (pFame >= 2) then
		SignPost = player:getQuestStatus(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);

		if (SignPost == 0) then
			player:setVar("MomTheAdventurer_Event",0);
			player:startEvent(0x00eb);
		else
			player:startEvent(0x007f);
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
	if (csid == 0x00e6) and (option == 0) then
		freeInventory = player:getFreeSlotsCount();

		if (freeInventory > 0) then
			player:setVar("MomTheAdventurer_Event",1);
			player:addItem(FIRE_CRYSTAL);
			player:messageSpecial(ITEMS_OBTAINED,FIRE_CRYSTAL,1);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,FIRE_CRYSTAL);
		end
	elseif (csid == 0x00e9 or csid == 0x00ea) then
		MomTheAdventurer = player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER);
		viewedItem = player:getVar("MomTheAdventurer_KeyItem");

		if (MomTheAdventurer == 1) then
			player:completeQuest(BASTOK,MOM_THE_ADVENTURER);
			player:addFame(BASTOK,BAS_FAME*50);
		else
			player:addFame(BASTOK,BAS_FAME*8)
		end

		if (viewedItem == 1) then
			gilReward = 100;
		else
			gilReward = 200;
		end

		player:delKeyItem(LETTER_FROM_ROH_LATTEH);
		player:setTitle(RINGBEARER);
		player:addGil(GIL_RATE*gilReward);
		player:messageSpecial(GIL_OBTAINED, GIL_RATE*gilReward);
		player:setVar("MomTheAdventurer_Event",3)
		player:setVar("MomTheAdventurer_KeyItem",0);
		player:needToZone(true);
	elseif (csid == 0x00eb and option == 0) then
		player:addQuest(BASTOK,BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
	end
end
