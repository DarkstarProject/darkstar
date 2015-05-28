-----------------------------------
--	Area: Windurst Waters
--	NPC:  Tosuka-Porika
--  Starts Quests: Early Bird Catches the Bookworm, Chasing Tales
--	Involved in Quests: Hat in Hand, Past Reflections, Blessed Radiance
--  Involved in Missions: Windurst 2-1, Windurst 7-1, Windurst 8-2, CoP 3-3
--  @pos -26 -6 103 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- cs notes
	-- 0x172 (370) = You have no mission, gtfo
	-- 0x17b (379) = Not sure yet (Adventurer from the other day?)
	-- 0x17c (380) = About the book of gods and "some adventurer"
	-- 0xa0 (160) = 1st cutscene of Windurst Mission 2-1
	-- 0xa1 (161) = More info on 2-1, if you talk to him right after the previous cutscene again

	local bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
	local glyphStatus = player:getQuestStatus(WINDURST,GLYPH_HANGER);
	local chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);

	local Fame = player:getFameLevel(WINDURST);

	if(player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x0321);
	
	elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")==10)then
		player:startEvent(0x036B); -- COP event

	-- Start Past Reflections in First -----------
	elseif(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS) then
		MissionStatus = player:getVar("MissionStatus");
		if(MissionStatus == 0) then
			player:startEvent(0x00a0); -- First CS for Mission 2-1
		elseif(MissionStatus > 0 and MissionStatus < 6) then
			player:startEvent(0x00a1); -- During Mission 2-1
		elseif(MissionStatus == 6) then
			player:startEvent(0x00a8); -- Finish Mission 2-1
		end
	elseif(bookwormStatus == QUEST_AVAILABLE and glyphStatus == QUEST_COMPLETED and Fame >= 2 and player:needToZone() == false) then
		player:startEvent(0x0183); -- Start Quest "Early Bird Catches the Bookworm"
	elseif(bookwormStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0184); -- During Quest "Early Bird Catches the Bookworm"
	elseif(player:getQuestStatus(WINDURST,HAT_IN_HAND) == QUEST_ACCEPTED or player:getVar("QuestHatInHand_var2") == 1) then
		function testflag(set,flag)
			return (set % (2*flag) >= flag)
		end
		if(testflag(tonumber(player:getVar("QuestHatInHand_var")),32) == false) then
			player:startEvent(0x0037); -- Show Off Hat
		end
	-- Book is A_SONG_OF_LOVE, KeyItem ID = 126
	elseif(chasingStatus == QUEST_AVAILABLE and bookwormStatus == QUEST_COMPLETED and WindyMission ~= THE_JESTER_WHO_D_BE_KING and Fame >= 3 and player:needToZone() == false) then
		player:startEvent(0x0193); --  Add initial cutscene
	elseif(chasingStatus == QUEST_ACCEPTED and player:getVar("CHASING_TALES_TRACK_BOOK") > 0) then
		player:startEvent(0x019c);
	elseif(player:hasKeyItem(149) ==true) then
		player:startEvent(0x019c);
	elseif(chasingStatus == QUEST_ACCEPTED) then
		player:startEvent(0x0196); --  Add follow up cutscene
		-- Windurst Mission 7-1 --
	elseif(player:getCurrentMission(WINDURST) == THE_SIXTH_MINISTRY and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x02cb,0,OPTISTERY_RING);
	elseif(player:getCurrentMission(WINDURST) == THE_SIXTH_MINISTRY and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x02cc,0,OPTISTERY_RING);
	elseif(player:getCurrentMission(WINDURST) == THE_SIXTH_MINISTRY and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x02d4);
	else
		player:startEvent(0x0172); -- Standard Conversation
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

	if(csid == 0x0037) then  -- Show Off Hat
		player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+32);
		player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
	elseif(csid == 0x00a0) then
		player:setVar("MissionStatus",1);
	elseif(csid == 0x00a8) then
		finishMissionTimeline(player,1,csid,option);
	elseif(csid == 0x0183 and option == 0) then -- Early Bird Catches the Bookworm
		player:addQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
	elseif(csid == 0x0193 and option == 0) then
	    player:addQuest(WINDURST,CHASING_TALES);
	elseif(csid ==0x036B)then
		player:setVar("MEMORIES_OF_A_MAIDEN_Status",11);
	elseif(csid == 0x02cb) then
		player:addKeyItem(OPTISTERY_RING);
		player:messageSpecial(KEYITEM_OBTAINED,OPTISTERY_RING);
		player:setVar("MissionStatus",1);
	elseif(csid == 0x02d4) then
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 0x0321) then
		player:addKeyItem(OPTISTERY_RING);
		player:messageSpecial(KEYITEM_OBTAINED,OPTISTERY_RING);
		if(player:hasKeyItem(AURASTERY_RING) and player:hasKeyItem(RHINOSTERY_RING)) then
			player:setVar("MissionStatus",2)
		end
	end
end;