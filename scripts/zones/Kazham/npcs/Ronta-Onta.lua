-----------------------------------
-- Area: Kazham
-- NPC:  Ronta-Onta
-- Starts and Finishes Quest: Trial by Fire
-- @pos 100 -15 -97 250
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	TrialByFire = player:getQuestStatus(OUTLANDS,TRIAL_BY_FIRE);
	WhisperOfFlames = player:hasKeyItem(WHISPER_OF_FLAMES);
	realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	
	if ((TrialByFire == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 6) or (TrialByFire == QUEST_COMPLETED and realday ~= player:getVar("TrialByFire_date"))) then 
		player:startEvent(0x010e,0,TUNING_FORK_OF_FIRE); -- Start and restart quest "Trial by Fire" 
	elseif (TrialByFire == QUEST_ACCEPTED and player:hasKeyItem(TUNING_FORK_OF_FIRE) == false and WhisperOfFlames == false) then 
		player:startEvent(0x011d,0,TUNING_FORK_OF_FIRE); -- Defeat against Ifrit : Need new Fork 
	elseif (TrialByFire == QUEST_ACCEPTED and WhisperOfFlames == false) then 
		player:startEvent(0x010f,0,TUNING_FORK_OF_FIRE,0); 
	elseif (TrialByFire == QUEST_ACCEPTED and WhisperOfFlames) then 
		numitem = 0;
		
		if (player:hasItem(17665)) then numitem = numitem + 1; end  -- Ifrits Blade
		if (player:hasItem(13241)) then numitem = numitem + 2; end  -- Fire Belt
		if (player:hasItem(13560)) then numitem = numitem + 4; end  -- Fire Ring
		if (player:hasItem(1203)) then numitem = numitem + 8; end   -- Egil's Torch
		if (player:hasSpell(298)) then numitem = numitem + 32; end  -- Ability to summon Ifrit 
		
		player:startEvent(0x0111,0,TUNING_FORK_OF_FIRE,0,0,numitem); 
	else 
		player:startEvent(0x0112); -- Standard dialog
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
	
	if (csid == 0x010e and option == 1) then
		if (player:getQuestStatus(OUTLANDS,TRIAL_BY_FIRE) == QUEST_COMPLETED) then
			player:delQuest(OUTLANDS,TRIAL_BY_FIRE);
		end
		player:addQuest(OUTLANDS,TRIAL_BY_FIRE);
		player:setVar("TrialByFire_date", 0);
		player:addKeyItem(TUNING_FORK_OF_FIRE);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_FIRE);
	elseif (csid == 0x011d) then
		player:addKeyItem(TUNING_FORK_OF_FIRE);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_FIRE);
	elseif (csid == 0x0111) then 
		item = 0;
		if (option == 1) then item = 17665; 		-- Ifrits Blade
		elseif (option == 2) then item = 13241;  -- Fire Belt
		elseif (option == 3) then item = 13560;  -- Fire Ring
		elseif (option == 4) then item = 1203; 	-- Egil's Torch
		end
		
		if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		else 
			if (option == 5) then 
				player:addGil(GIL_RATE*10000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gil
			elseif (option == 6) then 
				player:addSpell(298); -- Ifrit Spell
				player:messageSpecial(IFRIT_UNLOCKED,0,0,0); 
			else
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item); -- Item
			end
			player:addTitle(HEIR_OF_THE_GREAT_FIRE);
			player:delKeyItem(WHISPER_OF_FLAMES);
			player:setVar("TrialByFire_date", os.date("%j")); -- %M for next minute, %j for next day
			player:addFame(KAZHAM,WIN_FAME*30);
			player:completeQuest(OUTLANDS,TRIAL_BY_FIRE);
		end
	end
	
end;