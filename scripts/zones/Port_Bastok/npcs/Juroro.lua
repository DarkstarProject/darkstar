-----------------------------------
-- Area: Port Bastok
-- NPC: Juroro
-- Starts and Finishes Quest: Trial by Earth
-- @zone 236
-- @pos 32 7 -41
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	TrialByEarth = player:getQuestStatus(BASTOK,TRIAL_BY_EARTH);
	Fame = player:getFameLevel(BASTOK); 
	WhisperOfTremors = player:hasKeyItem(WHISPER_OF_TREMORS);
	realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	starttime = player:getVar("TrialByEarth_date");
	
	if((TrialByEarth == QUEST_AVAILABLE and Fame >= 6) or (TrialByEarth == QUEST_COMPLETED and realday ~= starttime)) then 
		player:startEvent(0x00f9,0,TUNING_FORK_OF_EARTH); -- Start and restart quest "Trial by Earth"
	elseif(TrialByEarth == QUEST_ACCEPTED and player:hasKeyItem(TUNING_FORK_OF_EARTH) == false and WhisperOfTremors == false) then 
		player:startEvent(0x011c,0,TUNING_FORK_OF_EARTH); -- Defeat against Titan : Need new Fork
	elseif(TrialByEarth == QUEST_ACCEPTED and WhisperOfTremors == false) then 
		player:startEvent(0x00fa,0,TUNING_FORK_OF_EARTH,1);
	elseif(TrialByEarth == QUEST_ACCEPTED and WhisperOfTremors) then 
		numitem = 0;
		
		if(player:hasItem(17438)) then numitem = numitem + 1; end  -- Titan's Cudgel
		if(player:hasItem(13244)) then numitem = numitem + 2; end  -- Earth Belt
		if(player:hasItem(13563)) then numitem = numitem + 4; end  -- Earth Ring
		if(player:hasItem(1205)) then numitem = numitem + 8; end   -- Desert Light
		if(player:hasSpell(299)) then numitem = numitem + 32; end  -- Ability to summon Titan
		
		player:startEvent(0x00fc,0,TUNING_FORK_OF_EARTH,1,0,numitem); 
	else 
		player:startEvent(0x00fd); -- Standard dialog
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
    
	if(csid == 0x00f9 and option == 1) then
		if(player:getQuestStatus(BASTOK,TRIAL_BY_EARTH) == QUEST_COMPLETED) then
			player:delQuest(BASTOK,TRIAL_BY_EARTH);
		end
		player:addQuest(BASTOK,TRIAL_BY_EARTH);
		player:setVar("TrialByEarth_date", 0);
		player:addKeyItem(TUNING_FORK_OF_EARTH);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_EARTH);
	elseif(csid == 0x011c) then 
		player:addKeyItem(TUNING_FORK_OF_EARTH);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_EARTH);
	elseif(csid == 0x00fc) then
		item = 0;
		if(option == 1) then item = 17438; 		-- Titan's Cudgel
		elseif(option == 2) then item = 13244;  -- Earth Belt
		elseif(option == 3) then item = 13563;  -- Earth Ring
		elseif(option == 4) then item = 1205; 	-- Desert Light
		end
		
		if(player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		else 
			if(option == 5) then 
				player:addGil(GIL_RATE*10000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gils
			elseif(option == 6) then 
				player:addSpell(299); -- Avatar Titan Spell
				player:messageSpecial(TITAN_UNLOCKED,299);
			else
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item); -- Item
			end
			player:setTitle(HEIR_OF_THE_GREAT_EARTH);
			player:delKeyItem(321); --Whisper of Tremors, as a trade for the above rewards
			player:setVar("TrialByEarth_date", os.date("%j")); -- %M for next minute, %j for next day
			player:addFame(BASTOK,BAS_FAME*30);
			player:completeQuest(BASTOK,TRIAL_BY_EARTH);
		end
	end
	
end;