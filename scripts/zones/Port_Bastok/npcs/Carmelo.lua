-----------------------------------
-- Area: Port Bastok
-- NPC: Carmelo
-- Start & Finishes Quest: Love and Ice, A Test of True Love
-- Start Quest: Lovers in the Dusk
-- Involved in Quest: The Siren's Tear
-- @zone: 236
-- @pos -146.476 -7.48 -10.889
-----------------------------------

require("scripts/globals/quests");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);
	local SirensTearProgress = player:getVar("SirensTear");
	local TheStarsOfIfrit = player:getQuestStatus(BASTOK,THE_STARS_OF_IFRIT);
	local LoveAndIce = player:getQuestStatus(BASTOK,LOVE_AND_ICE);
	local LoveAndIceProgress = player:getVar("LoveAndIceProgress");
	local ATestOfTrueLove = player:getQuestStatus(BASTOK,A_TEST_OF_TRUE_LOVE);
	local ATestOfTrueLoveProgress = player:getVar("ATestOfTrueLoveProgress");
	local LoversInTheDusk = player:getQuestStatus(BASTOK,LOVERS_IN_THE_DUSK);

	if (SirensTear == QUEST_ACCEPTED) then
		player:startEvent(0x0006);
	elseif (SirensTear == QUEST_COMPLETED and player:hasItem(576) == false and SirensTearProgress < 2) then
		player:startEvent(0x0013);
	elseif (LoveAndIce == QUEST_AVAILABLE and SirensTear == QUEST_COMPLETED and SirensTear == QUEST_COMPLETED) then
		if (player:getFameLevel(BASTOK) >= 5 and player:seenKeyItem(CARRIER_PIGEON_LETTER) == true) then
			player:startEvent(0x00b9);
		else
			player:startEvent(0x00bb);
		end
	elseif (LoveAndIce == QUEST_ACCEPTED and LoveAndIceProgress == 1) then
		player:startEvent(0x00ba);
	elseif (player:getFameLevel(BASTOK) >= 7 and ATestOfTrueLove == QUEST_AVAILABLE and LoveAndIce == QUEST_COMPLETED and player:needToZone() == false) then
		player:startEvent(0x010e);
	elseif (ATestOfTrueLove == QUEST_ACCEPTED and ATestOfTrueLoveProgress < 3) then
		player:startEvent(0x010f);
	elseif (ATestOfTrueLove == QUEST_ACCEPTED and ATestOfTrueLoveProgress == 3) then
		player:startEvent(0x0110);
	elseif (ATestOfTrueLove == QUEST_ACCEPTED and ATestOfTrueLoveProgress == 4 and player:needToZone() == true) then
		player:startEvent(0x0111);
	elseif (ATestOfTrueLove == QUEST_ACCEPTED and ATestOfTrueLoveProgress == 4 and player:needToZone() == false) then
		player:startEvent(0x0112);
	elseif (LoversInTheDusk == QUEST_AVAILABLE and ATestOfTrueLove == QUEST_COMPLETED and player:needToZone() == false) then
		player:startEvent(0x0113);
	elseif (LoversInTheDusk == QUEST_ACCEPTED) then
		player:startEvent(0x0114);
	elseif (LoversInTheDusk == QUEST_COMPLETED) then
		player:startEvent(0x0115);
	else
		player:startEvent(0x00b6);
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

	if (csid == 0x0006) then
		player:setVar("SirensTear",1);
	elseif (csid == 0x0013) then
		player:setVar("SirensTear",2);
	elseif (csid == 0x00b9) then
		player:addQuest(BASTOK,LOVE_AND_ICE);
		player:addKeyItem(CARMELOS_SONG_SHEET);
		player:messageSpecial(KEYITEM_OBTAINED,CARMELOS_SONG_SHEET);
	elseif (csid == 0x00ba) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17356);
		else 
			player:setVar("LoveAndIceProgress",0);
			player:needToZone(true);
			player:addTitle(SORROW_DROWNER);
			player:addItem(17356);
			player:messageSpecial(ITEM_OBTAINED,17356); -- Lamia Harp
			player:addFame(BASTOK,BAS_FAME*120);
			player:completeQuest(BASTOK,LOVE_AND_ICE);
		end
	elseif (csid == 0x010e) then
		player:addQuest(BASTOK,A_TEST_OF_TRUE_LOVE);
	elseif (csid == 0x0110) then
		player:setVar("ATestOfTrueLoveProgress",4);
		player:needToZone(true);
	elseif (csid == 0x0112) then
		player:setVar("ATestOfTrueLoveProgress",0);
		player:needToZone(true);
		player:addFame(BASTOK,BAS_FAME*120);
		player:completeQuest(BASTOK,A_TEST_OF_TRUE_LOVE);
	elseif (csid == 0x0113) then
		player:addQuest(BASTOK,LOVERS_IN_THE_DUSK);
		player:addKeyItem(CHANSON_DE_LIBERTE);
		player:messageSpecial(KEYITEM_OBTAINED,CHANSON_DE_LIBERTE);
	end
end;