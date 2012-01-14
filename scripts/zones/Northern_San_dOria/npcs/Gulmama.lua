-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Gulmama
-- Starts and Finishes Quest: Trial by Ice
-- @zone 231
-- @pos -186 0 107
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/teleports");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TrialByIce = player:getQuestStatus(SANDORIA,TRIAL_BY_ICE);
	Fame = player:getFameLevel(SANDORIA);
	WhisperOfFrost = player:hasKeyItem(WHISPER_OF_FROST);
	realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	starttime = player:getVar("TrialByIce_date");
	
	if((TrialByIce == QUEST_AVAILABLE and Fame >= 6) or (TrialByIce == QUEST_COMPLETED and realday ~= starttime)) then 
		player:startEvent(0x02c2,0,TUNING_FORK_OF_ICE); -- Start and restart quest "Trial by ice"
	elseif(TrialByIce == QUEST_ACCEPTED and player:hasKeyItem(TUNING_FORK_OF_ICE) == false and WhisperOfFrost == false) then 
		player:startEvent(0x02ce,0,TUNING_FORK_OF_ICE); -- Defeat against Shiva : Need new Fork
	elseif(TrialByIce == QUEST_ACCEPTED and WhisperOfFrost == false) then 
		player:startEvent(0x02c3,0,TUNING_FORK_OF_ICE,4);
	elseif(TrialByIce == QUEST_ACCEPTED and WhisperOfFrost == true) then 
		numitem = 0;
		
		if(player:hasItem(17492) == true) then numitem = numitem + 1; end  -- Shiva's Claws
		if(player:hasItem(13242) == true) then numitem = numitem + 2; end  -- Ice Belt
		if(player:hasItem(13561) == true) then numitem = numitem + 4; end  -- Ice Ring
		if(player:hasItem(1207) == true) then numitem = numitem + 8; end   -- Rust 'B' Gone
		--if(player:hasSpell(302) == true) then numitem = numitem + 32; end  -- Ability to summon Shiva	
		
		player:startEvent(0x02c5,0,TUNING_FORK_OF_ICE,4,0,numitem);
	else 
		player:startEvent(0x02c6); -- Standard dialog
	end
end;

-- 0x02c6*  0x02c2 start  0x02c3  0x02ce  0x02c4  0x02c5  0x02c9  0x02ca  0x02c8  0x02dd  0x02de  0x02e2  0x02e0  0x02e1
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
	if(csid == 0x02c2 and option == 1) then
		player:addQuest(SANDORIA,TRIAL_BY_ICE);
		player:setVar("TrialByIce_date", 0);
		player:addKeyItem(TUNING_FORK_OF_ICE);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_ICE);
	elseif(csid == 0x02ce) then 
		player:addKeyItem(TUNING_FORK_OF_ICE);
		player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_ICE);
	elseif(csid == 0x02c5) then
		item = 0;
		if(option == 1) then item = 17492; 		-- Shiva's Claws
		elseif(option == 2) then item = 13242;  -- Ice Belt
		elseif(option == 3) then item = 13561;  -- Ice Ring
		elseif(option == 4) then item = 1207; 	-- Rust 'B' Gone
		end
		
		if(player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
		else 
			if(option == 5) then 
				player:addGil(GIL_RATE*10000);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gils
			elseif(option == 6) then 
				player:addSpell(302); -- Avatar
				player:messageSpecial(SHIVA_UNLOCKED,302);
			else
				player:addItem(item);
				player:messageSpecial(ITEM_OBTAINED,item); -- Item
			end
			player:setVar("TrialByIce_date", os.date("%j")); -- %M for next minute, %j for next day
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,TRIAL_BY_ICE);
		end
	end
end;

