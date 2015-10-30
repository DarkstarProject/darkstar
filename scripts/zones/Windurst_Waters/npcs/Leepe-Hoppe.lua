-----------------------------------
-- Area: Windurst Waters
-- NPC:  Leepe-Hoppe
-- Involved in Mission 1-3, Mission 7-2
-- @pos 13 -9 -197 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local moonlitPath = player:getQuestStatus(WINDURST,THE_MOONLIT_PATH)
	local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day

	-- Check if we are on Windurst Mission 1-3
	if (player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
		MissionStatus = player:getVar("MissionStatus");

		if (player:hasKeyItem(FOOD_OFFERINGS) == false and player:hasKeyItem(DRINK_OFFERINGS) == false) then
			player:startEvent(0x008c);
		elseif (MissionStatus >= 1 and MissionStatus < 3) then
			player:startEvent(0x008e); -- Keep displaying the instructions
		end
	-- Check if we are on Windurst Mission 7-2
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x02DE);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x02DF);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x02E3);
	elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 5 and player:hasKeyItem(BOOK_OF_THE_GODS)) then
		player:startEvent(0x02E6);
	---------------------------
	elseif (player:getQuestStatus(WINDURST,FOOD_FOR_THOUGHT) == QUEST_ACCEPTED) then
		player:startEvent(0x0137);

	-- The Moonlit Path and Other Fenrir Stuff!
	elseif (moonlitPath == QUEST_AVAILABLE and
		player:getFameLevel(WINDURST) >= 6 and
		player:getFameLevel(SANDORIA) >= 6 and
		player:getFameLevel(BASTOK) >= 6 and
		player:getFameLevel(NORG) >= 4) then -- Fenrir flag event

		player:startEvent(0x034a,0,1125);
	elseif (moonlitPath == QUEST_ACCEPTED) then
		if (player:hasKeyItem(MOON_BAUBLE)) then -- Default text after acquiring moon bauble and before fighting Fenrir
			player:startEvent(0x034d,0,1125,334);
		elseif (player:hasKeyItem(WHISPER_OF_THE_MOON)) then -- First turn-in
			player:startEvent(0x034e,0,13399,1208,1125,0,18165,13572);
		elseif (player:hasKeyItem(WHISPER_OF_FLAMES) and
			player:hasKeyItem(WHISPER_OF_TREMORS) and
			player:hasKeyItem(WHISPER_OF_TIDES) and
			player:hasKeyItem(WHISPER_OF_GALES) and
			player:hasKeyItem(WHISPER_OF_FROST) and
			player:hasKeyItem(WHISPER_OF_STORMS)) then

			-- Collected the whispers
			player:startEvent(0x034c,0,1125,334);
		else -- Talked to after flag without the whispers
			player:startEvent(0x034b,0,1125);
		end
	elseif (moonlitPath == QUEST_COMPLETED) then
		if (player:hasKeyItem(MOON_BAUBLE)) then -- Default text after acquiring moon bauble and before fighting Fenrir
			player:startEvent(0x034d,0,1125,334);
		elseif (player:hasKeyItem(WHISPER_OF_THE_MOON)) then -- Repeat turn-in
			local availRewards = 0
			if (player:hasItem(18165)) then availRewards = availRewards + 1; end -- Fenrir's Stone
			if (player:hasItem(13572)) then availRewards = availRewards + 2; end -- Fenrir's Cape
			if (player:hasItem(13138)) then availRewards = availRewards + 4; end -- Fenrir's Torque
			if (player:hasItem(13399)) then availRewards = availRewards + 8; end -- Fenrir's Earring
			if (player:hasItem(1208)) then availRewards = availRewards + 16; end -- Ancient's Key
			if (player:hasSpell(297)) then availRewards = availRewards + 64; end -- Pact

			player:startEvent(0x0352,0,13399,1208,1125,availRewards,18165,13572);
		elseif (realday ~= player:getVar("MoonlitPath_date")) then --24 hours have passed, flag a new fight
			player:startEvent(0x0350,0,1125,334);
		else
			player:startEvent(0x034f,0,1125); -- Yes, this will indefinitely replace his standard dialogue!
		end
	else
		player:startEvent(0x0159); -- Standard Dialogue?
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
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	if (csid == 0x008c) then
		player:setVar("MissionStatus",1);
		player:setVar("ohbiru_dohbiru_talk",0);
		player:addKeyItem(FOOD_OFFERINGS);
		player:messageSpecial(KEYITEM_OBTAINED,FOOD_OFFERINGS);
		player:addKeyItem(DRINK_OFFERINGS);
		player:messageSpecial(KEYITEM_OBTAINED,DRINK_OFFERINGS);

	-- Moonlit Path and Other Fenrir Stuff
	elseif (csid == 0x034a and option == 2) then
		player:addQuest(WINDURST,THE_MOONLIT_PATH);
	elseif (csid == 0x034c) then
		player:addKeyItem(MOON_BAUBLE);
		player:messageSpecial(KEYITEM_OBTAINED,MOON_BAUBLE);
		player:delKeyItem(WHISPER_OF_FLAMES);
		player:delKeyItem(WHISPER_OF_TREMORS);
		player:delKeyItem(WHISPER_OF_TIDES);
		player:delKeyItem(WHISPER_OF_GALES);
		player:delKeyItem(WHISPER_OF_FROST);
		player:delKeyItem(WHISPER_OF_STORMS);
		player:delQuest(OUTLANDS,TRIAL_BY_FIRE);
		player:delQuest(BASTOK,TRIAL_BY_EARTH);
		player:delQuest(OUTLANDS,TRIAL_BY_WATER);
		player:delQuest(OUTLANDS,TRIAL_BY_WIND);
		player:delQuest(SANDORIA,TRIAL_BY_ICE);
		player:delQuest(OTHER_AREAS,TRIAL_BY_LIGHTNING);
	elseif (csid == 0x034e) then -- Turn-in event
		player:addTitle(HEIR_OF_THE_NEW_MOON);
		player:delKeyItem(WHISPER_OF_THE_MOON);
		player:setVar("MoonlitPath_date", os.date("%j")); -- %M for next minute, %j for next day
		player:addFame(WINDURST,30);
		player:completeQuest(WINDURST,THE_MOONLIT_PATH);

		reward = 0

		if (option == 1) then reward = 18165; -- Fenrir's Stone
		elseif (option == 2) then reward = 13572; -- Fenrir's Cape
		elseif (option == 3) then reward = 13138; -- Fenrir's Torque
		elseif (option == 4) then reward = 13399; -- Fenrir's Earring
		elseif (option == 5) then reward = 1208; -- Ancient's Key
		elseif (option == 6) then
			player:addGil(GIL_RATE*10000);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gil
		elseif (option == 7) then
			player:addSpell(297) -- Pact
		end

		if (player:getFreeSlotsCount() == 0 and reward ~= 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,reward);
		elseif (reward ~= 0) then
			player:addItem(reward);
			player:messageSpecial(ITEM_OBTAINED,reward);
		end

		if (player:getNation() == WINDURST and player:getRank() == 10 and player:getQuestStatus(WINDURST,THE_PROMISE) == QUEST_COMPLETED) then
			player:addKeyItem(DARK_MANA_ORB);
			player:messageSpecial(KEYITEM_OBTAINED,DARK_MANA_ORB);
		end
	elseif (csid == 0x0352) then -- Repeat turn-in event
		player:addTitle(HEIR_OF_THE_NEW_MOON);
		player:delKeyItem(WHISPER_OF_THE_MOON);
		player:setVar("MoonlitPath_date", os.date("%j")); -- %M for next minute, %j for next day
		player:addFame(WINDURST,30);

		reward = 0

		if (option == 1) then reward = 18165; -- Fenrir's Stone
		elseif (option == 2) then reward = 13572; -- Fenrir's Cape
		elseif (option == 3) then reward = 13138; -- Fenrir's Torque
		elseif (option == 4) then reward = 13399; -- Fenrir's Earring
		elseif (option == 5) then reward = 1208; -- Ancient's Key
		elseif (option == 6) then
			player:addGil(GIL_RATE*10000);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*15000); -- Gil
		elseif (option == 7) then
			player:addSpell(297) -- Pact
		end

		if (player:getFreeSlotsCount() == 0 and reward ~= 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,reward);
		elseif (reward ~= 0) then
			player:addItem(reward);
			player:messageSpecial(ITEM_OBTAINED,reward);
		end

		if (player:getNation() == WINDURST and player:getRank() == 10 and player:getQuestStatus(WINDURST,THE_PROMISE) == QUEST_COMPLETED) then
			player:addKeyItem(DARK_MANA_ORB);
			player:messageSpecial(KEYITEM_OBTAINED,DARK_MANA_ORB);
		end
	elseif (csid == 0x0350) then
		player:addKeyItem(MOON_BAUBLE);
		player:messageSpecial(KEYITEM_OBTAINED,MOON_BAUBLE);
	elseif (csid == 0x02DE) then
		player:setVar("MissionStatus",1);
	elseif (csid == 0x02E6) then
		finishMissionTimeline(player,3,csid,option);
	end

end;