-----------------------------------
-- Area: Metalworks
-- NPC:  Cid
-- Starts & Finishes Quest: Cid's Secret, The Usual, Dark Puppet (start)
-- @zone 237
-- @pos -12 -12 1
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
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

	if(player:getCurrentMission(BASTOK) == THE_CRYSTAL_LINE and player:getVar("MissionStatus") == 1) then
		if(trade:getItemQty(613,1) and trade:getItemCount() == 1) then
			player:startEvent(0x01fa);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	
	if(mJob == 8 and mLvl >= AF2_QUEST_LEVEL and player:getQuestStatus(BASTOK,DARK_LEGACY) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,DARK_PUPPET) == QUEST_AVAILABLE) then
		player:startEvent(0x02f8); -- Start Quest "Dark Puppet"
	elseif(player:getCurrentMission(BASTOK) == GEOLOGICAL_SURVEY) then
		if(player:hasKeyItem(RED_ACIDITY_TESTER)) then
			player:startEvent(0x01f8);
		elseif(player:hasKeyItem(BLUE_ACIDITY_TESTER) == false) then
			player:startEvent(0x01f7);
		end
	elseif(player:getCurrentMission(BASTOK) == THE_CRYSTAL_LINE) then
		if(player:hasKeyItem(C_L_REPORTS)) then
			player:showText(npc,MISSION_DIALOG_CID_TO_AYAME);
		else
			player:startEvent(0x01f9);
		end
	elseif(player:getFameLevel(BASTOK) >= 4) then
		CidsSecret = player:getQuestStatus(BASTOK,CID_S_SECRET);
    	if(CidsSecret ~= QUEST_COMPLETED) then
			questKeyItem = player:hasKeyItem(UNFINISHED_LETTER);

			if(CidsSecret == QUEST_AVAILABLE) then
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
		finishMissionTimeline(player,1,csid,option);
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
