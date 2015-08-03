-----------------------------------
-- Area: Rabao
-- NPC:  Agado-Pugado
-- Starts and Finishes Quest: Trial by Wind
-- @pos -17 7 -10 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local TrialByWind = player:getQuestStatus(OUTLANDS,TRIAL_BY_WIND);
	local WhisperOfGales = player:hasKeyItem(323);
	local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	local CarbuncleDebacle = player:getQuestStatus(WINDURST,CARBUNCLE_DEBACLE);
	local CarbuncleDebacleProgress = player:getVar("CarbuncleDebacleProgress");
	
	---------------------------------------------------------------------
	-- Carbuncle Debacle
	if (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 5 and player:hasKeyItem(DAZEBREAKER_CHARM) == true) then
		player:startEvent(0x0056); -- get the wind pendulum, lets go to Cloister of Gales
	elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 6) then
		if (player:hasItem(1174) == false) then
			player:startEvent(0x0057,0,1174,0,0,0,0,0,0); -- "lost the pendulum?" This one too~???
		else
			player:startEvent(0x0058); -- reminder to go to Cloister of Gales
		end;
	---------------------------------------------------------------------
	-- Trial by Wind
	elseif ((TrialByWind == QUEST_AVAILABLE and player:getFameLevel(RABAO) >= 5) or (TrialByWind == QUEST_COMPLETED and realday ~= player:getVar("TrialByWind_date"))) then 
		player:startEvent(0x0042,0,331); -- Start and restart quest "Trial by Wind"
	elseif (TrialByWind == QUEST_ACCEPTED and player:hasKeyItem(331) == false and WhisperOfGales == false) then 
		player:startEvent(0x006b,0,331); -- Defeat against Avatar : Need new Fork
	elseif (TrialByWind == QUEST_ACCEPTED and WhisperOfGales == false) then 
		player:startEvent(0x0043,0,331,3);
	elseif (TrialByWind == QUEST_ACCEPTED and WhisperOfGales) then 
		numitem = 0;
		
		if (player:hasItem(17627)) then numitem = numitem + 1; end  -- Garuda's Dagger
		if (player:hasItem(13243)) then numitem = numitem + 2; end  -- Wind Belt 
		if (player:hasItem(13562)) then numitem = numitem + 4; end  -- Wind Ring
		if (player:hasItem(1202)) then numitem = numitem + 8; end   -- Bubbly Water
		if (player:hasSpell(301)) then numitem = numitem + 32; end  -- Ability to summon Garuda
		
		player:startEvent(0x0045,0,331,3,0,numitem);
	else 
		player:startEvent(0x0046); -- Standard dialog
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
	if (csid == 0x0042 and option == 1) then
		if (player:getQuestStatus(OUTLANDS,TRIAL_BY_WIND) == QUEST_COMPLETED) then
			player:delQuest(OUTLANDS,TRIAL_BY_WIND);
		end
		player:addQuest(OUTLANDS,TRIAL_BY_WIND);
		player:setVar("TrialByWind_date", 0);
		player:addKeyItem(TUNING_FORK_OF_WIND);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_WIND);
	elseif (csid == 0x006b) then
		player:addKeyItem(TUNING_FORK_OF_WIND);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_WIND);
	elseif (csid == 0x0045) then 
		item = 0;
		if (option == 1) then item = 17627; 		-- Garuda's Dagger
		elseif (option == 2) then item = 13243;  -- Wind Belt 
		elseif (option == 3) then item = 13562;  -- Wind Ring
		elseif (option == 4) then item = 1202; 	-- Bubbly Water
		end
		
		if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		else 
			if (option == 5) then 
				player:addGil(GIL_RATE*10000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gil
			elseif (option == 6) then 
				player:addSpell(301); -- Garuda Spell
				player:messageSpecial(GARUDA_UNLOCKED,0,0,3); 
			else
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item); -- Item
			end
			player:addTitle(HEIR_OF_THE_GREAT_WIND);
			player:delKeyItem(WHISPER_OF_GALES); --Whisper of Gales, as a trade for the above rewards
			player:setVar("TrialByWind_date", os.date("%j")); -- %M for next minute, %j for next day
			player:addFame(RABAO,30);
			player:completeQuest(OUTLANDS,TRIAL_BY_WIND);
		end
	elseif (csid == 0x0056 or csid == 0x0057) then
		if (player:getFreeSlotsCount() ~= 0) then
			player:addItem(1174);
			player:messageSpecial(ITEM_OBTAINED,1174);
			player:setVar("CarbuncleDebacleProgress",6);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1174);
		end;
	end
end;



