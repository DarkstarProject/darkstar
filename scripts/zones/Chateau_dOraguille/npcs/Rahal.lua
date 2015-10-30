-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Rahal
-- Involved in Quests: The Holy Crest, Lure of the Wildcat (San d'Oria)
-- @pos -28 0.1 -6 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local CrestProgress = player:getVar("TheHolyCrest_Event");
	local RemedyKI = player:hasKeyItem(DRAGON_CURSE_REMEDY);
	local Stalker_Quest = player:getQuestStatus(SANDORIA,KNIGHT_STALKER);
	local StalkerProgress = player:getVar("KnightStalker_Progress");
	local WildcatSandy = player:getVar("WildcatSandy");
	
	if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,17) == false) then
		player:startEvent(0x022f);
	-- Need to speak with Rahal to get Dragon Curse Remedy
	elseif (CrestProgress == 5 and RemedyKI == false) then
		player:startEvent(0x003c); -- Gives key item
	elseif (CrestProgress == 5 and RemedyKI == true) then
		player:startEvent(122); -- Reminder to go to Gelsba
	 -- Completed AF2, AF3 available, and currently on DRG.  No level check, since they cleared AF2.
	elseif (player:getQuestStatus(SANDORIA,CHASING_QUOTAS) == QUEST_COMPLETED and Stalker_Quest == QUEST_AVAILABLE and player:getMainJob() == 14) then
		if (player:getVar("KnightStalker_Declined") == 0) then
			player:startEvent(121); -- Start AF3
		else
			player:startEvent(120); -- Short version if they previously declined
		end
	elseif Stalker_Quest == QUEST_ACCEPTED then
		if (StalkerProgress == 0) then
			player:startEvent(119); -- Reminder to go to Brugaire/Ceraulian
		elseif (player:hasKeyItem(CHALLENGE_TO_THE_ROYAL_KNIGHTS) == true) then
			if (StalkerProgress == 1) then
				player:startEvent(78); -- Reaction to challenge, go talk to Balasiel
			elseif (StalkerProgress == 2) then
				player:startEvent(69); -- Reminder to talk to Balasiel
			elseif (StalkerProgress == 3) then
				player:startEvent(110); -- To the south with you
			end
		end
	elseif (player:getVar("KnightStalker_Option2") == 1) then
		player:startEvent(118); -- Optional CS after Knight Stalker
		-- Mission 8-2 San dOria --
	elseif (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x006A)
	elseif (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x006b);
	else
		player:startEvent(0x0211); -- standard dialogue
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

	if (csid == 0x003c) then
		player:addKeyItem(DRAGON_CURSE_REMEDY);
		player:messageSpecial(KEYITEM_OBTAINED, DRAGON_CURSE_REMEDY);
	elseif (csid == 0x022f) then
		player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",17,true);
	elseif (csid == 121) then
		if (option == 1) then
			player:addQuest(SANDORIA,KNIGHT_STALKER);
		else
			player:setVar("KnightStalker_Declined",1);
		end
	elseif (csid == 120 and option == 1) then
		player:addQuest(SANDORIA,KNIGHT_STALKER);
		player:setVar("KnightStalker_Declined",0);
	elseif (csid == 78) then
		player:setVar("KnightStalker_Progress",2);
	elseif (csid == 110) then
		player:setVar("KnightStalker_Progress",4);
	elseif (csid == 118) then
		player:setVar("KnightStalker_Option2",0);
	elseif (csid == 0x006A) then
		if (player:hasKeyItem(CRYSTAL_DOWSER)) then
			player:delKeyItem(CRYSTAL_DOWSER); -- To prevent them getting a message about already having the keyitem
		else
			player:setVar("MissionStatus",2);
			player:addKeyItem(CRYSTAL_DOWSER);
			player:messageSpecial(KEYITEM_OBTAINED,CRYSTAL_DOWSER);
		end
	end
end;

-- Already in-use cutscenes are not listed
-- 563 - ToAU, brought a letter from "Sage Raillefal."
-- 564 - Show Raillefal's letter to Halver?  Goes to 563.
-- 9 - Destin gives an address, Mission CS, Rahal appears
-- 10 - Destin gives another speech, Mission CS, Claide reports on Rochefogne
-- 100 - Destin speech, mission, Lightbringer
-- 106 - Take this CRYSTAL_DOWSER and go to Temple of Uggalepih
-- 107 - Short version/reminder for 106
-- 105 - Unable to locate Lightbringer, but Curilla found it
-- 42 - Had my doubts about treasure, but Curilla found it.  Why was it on that island?
-- 37 - Rochefogne slain?
-- 38 - Rites of Succession
-- 39 - Dedicates upcoming battle in Fei'Yin to fallen knights.
-- 40 - Thanks for help.  Wrap up for what 39 is suggesting?
-- 41 - Lightbringer sealed away.  Thanks for help.
-- 529 - I am Rahal S Lebrart of the Royal Knights.  Possible fall back dialog if nothing active?
-- 544 - "I understand his lordship's fervor, but the risk is too great for us.  I believe this requires utmost caution."
-- 77 - "Commendable work.  With our mortal enemy vanquished, we must now restore glory to San d'Oria.  Your cooperation is expected!"
-- 534 - Halver CS, re: Rank 5 fight in Fei'Yin
-- 559 - Lure of the Wildcat