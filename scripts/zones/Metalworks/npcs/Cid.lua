-----------------------------------
-- Area: Metalworks
-- NPC:  Cid
-- Starts & Finishes Quest: Cid's Secret, The Usual, Dark Puppet (start)
-- @zone 237
-- @pos 14 -10 2
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(trade:getItemQty(FADED_CRYSTAL,1) and trade:getItemCount() == 1) then
		player:startEvent(0x01fa);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(BASTOK,DARK_LEGACY) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,DARK_PUPPET) == QUEST_AVAILABLE) then
		player:startEvent(0x02f8); -- Start Quest "Dark Puppet"
	elseif(player:getCurrentMission(BASTOK) == GEOLOGICAL_SURVEY) then
		if(player:hasKeyItem(RED_ACIDITY_TESTER)) then
			player:startEvent(0x01f8);
		elseif(player:hasKeyItem(BLUE_ACIDITY_TESTER) == false) then
			player:startEvent(0x01f7);
		end
	elseif(player:getCurrentMission(BASTOK) == THE_CRYSTAL_LINE) then
		if(player:hasKeyItem(C_L_REPORTS)) then
			player:showText(npc,7376);
		else
			player:startEvent(0x01f9);
		end
	elseif(player:getFameLevel(BASTOK) >= 4) then
		CidsSecret = player:getQuestStatus(BASTOK,CID_S_SECRET);
    	if(CidsSecret ~= 2) then
			questKeyItem = player:hasKeyItem(UNFINISHED_LETTER);

			if(CidsSecret == 0) then
				player:startEvent(0x01fb);
			elseif(player:getVar("CidsSecret_Event") == 1 and questKeyItem == false) then
				player:startEvent(0x01fc);
			elseif(questKeyItem) then
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
	
	if(csid == 0x02f8) then
		player:addQuest(BASTOK,DARK_PUPPET);
		player:setVar("darkPuppetCS",1);
	elseif(csid == 0x01f7) then
		player:addKeyItem(BLUE_ACIDITY_TESTER);
		player:messageSpecial(KEYITEM_OBTAINED, BLUE_ACIDITY_TESTER);
	elseif(csid == 0x01f8) then
		player:completeMission(1);
		player:delKeyItem(RED_ACIDITY_TESTER);
	elseif(csid == 0x01f9 and option == 0) then
		if(player:getVar("MissionStatus") == 0) then
			if(player:getFreeSlotsCount(0) >= 1) then
				crystal = math.random(4096,4104);
				player:addItem(crystal);
				player:messageSpecial(ITEM_OBTAINED, crystal);
				player:setVar("MissionStatus",1);
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
			end
		end
	elseif(csid == 0x01fa and option == 0) then
		player:tradeComplete();
		player:addKeyItem(C_L_REPORTS);
		player:messageSpecial(KEYITEM_OBTAINED, C_L_REPORTS);
    elseif(csid == 0x01fb and option == 0) then
        player:addQuest(BASTOK,CID_S_SECRET);
    elseif(csid == 0x01fd) then
		if(player:getFreeSlotsCount(0) >= 1) then
			player:delKeyItem(UNFINISHED_LETTER);
			player:setVar("CidsSecret_Event",0);
			player:addItem(RAM_MANTLE);
			player:messageSpecial(ITEM_OBTAINED,RAM_MANTLE);
			player:addFame(BASTOK,BAS_FAME*30);
			player:completeQuest(BASTOK,CID_S_SECRET);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,RAM_MANTLE);
		end
     end
end;
