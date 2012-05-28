-----------------------------------
-- Area: Norg
-- NPC: Edal-Tahdal
-- Starts and Finishes Quest: Trial by Water
-----------------------------------

package.loaded["scripts/zones/Norg/TextIDs"] = nil;

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	TrialByWater = player:getQuestStatus(OUTLANDS,TRIAL_BY_WATER);
	WhisperOfTides = player:hasKeyItem(322);
	realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	
	if((TrialByWater == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 4) or (TrialByWater == QUEST_COMPLETED and realday ~= player:getVar("TrialByWater_date"))) then 
		player:startEvent(0x006d,0,330); -- Start and restart quest "Trial by Water"
	elseif(TrialByWater == QUEST_ACCEPTED and player:hasKeyItem(330) == false and WhisperOfTides == false) then 
		player:startEvent(0x00be,0,330); -- Defeat against Avatar : Need new Fork
	elseif(TrialByWater == QUEST_ACCEPTED and WhisperOfTides == false) then 
		player:startEvent(0x006e,0,330,2);
	elseif(TrialByWater == QUEST_ACCEPTED and WhisperOfTides) then 
		numitem = 0;
		
		if(player:hasItem(17439)) then numitem = numitem + 1; end  -- Leviathan's Rod
		if(player:hasItem(13246)) then numitem = numitem + 2; end  -- Water Belt 
		if(player:hasItem(13565)) then numitem = numitem + 4; end  -- Water Ring
		if(player:hasItem(1204)) then numitem = numitem + 8; end   -- Eye of Nept
		if(player:hasSpell(300)) then numitem = numitem + 32; end  -- Ability to summon Leviathan
		
		player:startEvent(0x0070,0,330,2,0,numitem);
	else 
		player:startEvent(0x0071); -- Standard dialog
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
	if(csid == 0x006d and option == 1) then
		if(player:getQuestStatus(OUTLANDS,TRIAL_BY_WATER) == QUEST_COMPLETED) then
			player:delQuest(OUTLANDS,TRIAL_BY_WATER);
		end
		player:addQuest(OUTLANDS,TRIAL_BY_WATER);
		player:setVar("TrialByWater_date", 0);
		player:addKeyItem(330);
		player:messageSpecial(KEYITEM_OBTAINED,330);
	elseif(csid == 0x00be) then
		player:addKeyItem(330);
		player:messageSpecial(KEYITEM_OBTAINED,330);
	elseif(csid == 0x0070) then 
		item = 0;
		if(option == 1) then item = 17439; 		-- Leviathan's Rod
		elseif(option == 2) then item = 13246;  -- Water Belt
		elseif(option == 3) then item = 13565;  -- Water Ring
		elseif(option == 4) then item = 1204; 	-- Eye of Nept
		end
		
		if(player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		else 
			if(option == 5) then 
				player:addGil(GIL_RATE*10000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gil
			elseif(option == 6) then 
				player:addSpell(300); -- Avatar
				player:messageSpecial(LEVIATHAN_UNLOCKED,300); 
			else
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item); -- Item
			end
			player:setTitle(HEIR_OF_THE_GREAT_WATER);
			player:delKeyItem(322); --Whisper of Tides, as a trade for the above rewards
			player:setVar("TrialByWater_date", os.date("%j")); -- %M for next minute, %j for next day
			player:addFame(OUTLANDS,NORG_FAME*30);
			player:completeQuest(OUTLANDS,TRIAL_BY_WATER);
		end
	end
end;



