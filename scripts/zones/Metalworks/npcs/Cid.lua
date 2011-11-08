-----------------------------------
-- Area: Metalworks
-- NPC: Cid
-- Starts & Finishes Quest: Cid's Secret
-- Starts & Finishes Quest: The Usual
-- Involved in Missions
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	count = trade:getItemCount();
	gil = trade:getGil();

	if (trade:getItemQty(FADED_CRYSTAL,1) and count == 1 and gil == 0) then
		player:startEvent(0x01fa);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:hasCurrentMission(1)) then
		currentMission = player:getCurrentMission(1);

		if (currentMission == 1) then
			if (player:hasKeyItem(RED_ACIDITY_TESTER) == true) then
				player:startEvent(0x01f8);
			elseif (player:hasKeyItem(BLUE_ACIDITY_TESTER) == false) then
				player:startEvent(0x01f7);
			else
			end
		elseif (currentMission == 3) then
			if (player:hasKeyItem(C_L_REPORTS)) then
				player:showText(npc,7376);
			else
				player:startEvent(0x01f9);
			end
		end
    elseif (player:getFameLevel(BASTOK) >= 4) then
		CidsSecret = player:getQuestStatus(BASTOK,CID_S_SECRET);
    	if (CidsSecret ~= 2) then
			questKeyItem = player:hasKeyItem(UNFINISHED_LETTER);

			if (CidsSecret == 0) then
				player:startEvent(0x01fb);
			elseif (player:getVar("CidsSecret_Event") == 1 and questKeyItem == false) then
				player:startEvent(0x01fc);
			elseif (questKeyItem) then
				player:startEvent(0x01fd);
			else
				player:startEvent(0x01f6);
			end
		end
    else
        player:startEvent(0x01f4);
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
	if (csid == 0x01f7) then
		player:addKeyItem(BLUE_ACIDITY_TESTER);
		player:messageSpecial(KEYITEM_OBTAINED, BLUE_ACIDITY_TESTER);
	elseif (csid == 0x01f8) then
		player:completeMission(1);
		player:delKeyItem(RED_ACIDITY_TESTER);
	elseif (csid == 0x01f9 and option == 0) then
		if (player:getVar("MissionStatus") == 0) then
			if (player:getFreeSlotsCount(0) >= 1) then
				crystal = math.random(4096,4104);
				player:addItem(crystal);
				player:messageSpecial(ITEM_OBTAINED, crystal);
				player:setVar("MissionStatus",1);
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
			end
		end
	elseif (csid == 0x01fa and option == 0) then
		player:tradeComplete();
		player:addKeyItem(C_L_REPORTS);
		player:messageSpecial(KEYITEM_OBTAINED, C_L_REPORTS);
    elseif (csid == 0x01fb and option == 0) then
        player:addQuest(BASTOK,CID_S_SECRET);
    elseif (csid == 0x01fd) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:completeQuest(BASTOK,CID_S_SECRET);
			player:addFame(BASTOK,BAS_FAME*50);
			player:addItem(RAM_MANTLE);
			player:messageSpecial(ITEM_OBTAINED,RAM_MANTLE);
			player:delKeyItem(UNFINISHED_LETTER);
			player:setVar("CidsSecret_Event",0);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,RAM_MANTLE);
		end
     end
end;
