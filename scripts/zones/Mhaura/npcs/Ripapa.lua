-----------------------------------
-- Area: Mhaura
-- NPC:  Ripapa 
-- Starts and Finishes Quest: Trial by Lightning
-- @pos 29 -15 55 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local TrialByLightning = player:getQuestStatus(OTHER_AREAS,TRIAL_BY_LIGHTNING);
	local WhisperOfStorms = player:hasKeyItem(WHISPER_OF_STORMS);
	local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	local CarbuncleDebacle = player:getQuestStatus(WINDURST,CARBUNCLE_DEBACLE);
	local CarbuncleDebacleProgress = player:getVar("CarbuncleDebacleProgress");
	
	---------------------------------------------------------------------
	-- Carbunlce Debacle
	if (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 2) then
		player:startEvent(0x2726); -- get the lighning pendulum lets go to Cloister of Storms
	elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 3 and player:hasItem(1172) == false) then
		player:startEvent(0x2727,0,1172,0,0,0,0,0,0); -- "lost the pendulum?"
	---------------------------------------------------------------------
	-- Trial by Lightning
	elseif ((TrialByLightning == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 6) or (TrialByLightning == QUEST_COMPLETED and realday ~= player:getVar("TrialByLightning_date"))) then 
		player:startEvent(0x2720,0,TUNING_FORK_OF_LIGHTNING); -- Start and restart quest "Trial by Lightning"
	elseif (TrialByLightning == QUEST_ACCEPTED and player:hasKeyItem(TUNING_FORK_OF_LIGHTNING) == false and WhisperOfStorms == false) then 
		player:startEvent(0x2728,0,TUNING_FORK_OF_LIGHTNING); -- Defeat against Ramuh : Need new Fork
	elseif (TrialByLightning == QUEST_ACCEPTED and WhisperOfStorms == false) then 
		player:startEvent(0x2721,0,TUNING_FORK_OF_LIGHTNING,5);
	elseif (TrialByLightning == QUEST_ACCEPTED and WhisperOfStorms) then 
		numitem = 0;
		
		if (player:hasItem(17531)) then numitem = numitem + 1; end  -- Ramuh's Staff
		if (player:hasItem(13245)) then numitem = numitem + 2; end  -- Lightning Belt 
		if (player:hasItem(13564)) then numitem = numitem + 4; end  -- Lightning Ring
		if (player:hasItem(1206)) then numitem = numitem + 8; end   -- Elder Branch 
		if (player:hasSpell(303)) then numitem = numitem + 32; end  -- Ability to summon Ramuh
		
		player:startEvent(0x2723,0,TUNING_FORK_OF_LIGHTNING,5,0,numitem);
	else 
		player:startEvent(0x2724); -- Standard dialog
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
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x2720 and option == 1) then
		if (player:getQuestStatus(OTHER_AREAS,TRIAL_BY_LIGHTNING) == QUEST_COMPLETED) then
			player:delQuest(OTHER_AREAS,TRIAL_BY_LIGHTNING);
		end
		player:addQuest(OTHER_AREAS,TRIAL_BY_LIGHTNING);
		player:setVar("TrialByLightning_date", 0);
		player:addKeyItem(TUNING_FORK_OF_LIGHTNING);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_LIGHTNING);
	elseif (csid == 0x2728) then
		player:addKeyItem(TUNING_FORK_OF_LIGHTNING);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_LIGHTNING);
	elseif (csid == 0x2723) then 
		item = 0;
		if (option == 1) then item = 17531; 		-- Ramuh's Staff
		elseif (option == 2) then item = 13245;  -- Lightning Belt 
		elseif (option == 3) then item = 13564;  -- Lightning Ring
		elseif (option == 4) then item = 1206; 	-- Elder Branch
		end
		
		if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		else 
			if (option == 5) then 
				player:addGil(GIL_RATE*10000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gil
			elseif (option == 6) then 
				player:addSpell(303); -- Ramuh Spell
				player:messageSpecial(RAMUH_UNLOCKED,0,0,5); 
			else
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item); -- Item
			end
			player:addTitle(HEIR_OF_THE_GREAT_LIGHTNING);
			player:delKeyItem(WHISPER_OF_STORMS); --Whisper of Storms, as a trade for the above rewards
			player:setVar("TrialByLightning_date", os.date("%j")); -- %M for next minute, %j for next day
			player:addFame(OTHER_AREAS,WIN_FAME*30);
			player:completeQuest(OTHER_AREAS,TRIAL_BY_LIGHTNING);
		end
	elseif (csid == 0x2726 or csid == 0x2727) then
		if (player:getFreeSlotsCount() ~= 0) then
			player:addItem(1172);
			player:messageSpecial(ITEM_OBTAINED,1172);
			player:setVar("CarbuncleDebacleProgress",3);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1172);
		end;
	end
	
end;
