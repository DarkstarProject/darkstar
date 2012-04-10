-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Castilchat
-- Starts Quest: Trial Size Trial by Ice
-- @pos -186 0 107 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/teleports");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- "Flyers for Regine" conditional script
	FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if(FlyerForRegine == QUEST_ACCEPTED and trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
		player:messageSpecial(FLYER_REFUSED);
	elseif(trade:hasItemQty(1545,1) and trade:getItemCount() == 1) then -- Trade mini fork of ice
		player:startEvent(0x02de,0,1545,4,player:getMainLvl(),2);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	TrialSizeByIce = player:getQuestStatus(SANDORIA,TRIAL_SIZE_TRIAL_BY_ICE);
	SMNLvL = player:getMainLvl();
	
	if(TrialSizeByIce == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2 and player:getMainJob() == 15 and SMNLvL >= 15) then 
		player:startEvent(0x02dd,0,1545,4,20);
	elseif(TrialSizeByIce == QUEST_ACCEPTED and player:hasItem(MINI_TUNING_FORK_OF_ICE) == false) then
		player:startEvent(0x02de,0,1545,4,SMNLvL,1);
	else
		player:startEvent(0x02c7);
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
	
	if(csid == 0x02dd and option == 1) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,MINI_TUNING_FORK_OF_ICE);
		else 
			player:addQuest(SANDORIA,TRIAL_SIZE_TRIAL_BY_ICE);
			player:addItem(MINI_TUNING_FORK_OF_ICE);
			player:messageSpecial(ITEM_OBTAINED,MINI_TUNING_FORK_OF_ICE);
		end
	elseif(csid == 0x02de and option == 0) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,MINI_TUNING_FORK_OF_ICE);
		else 
			player:addItem(MINI_TUNING_FORK_OF_ICE);
			player:messageSpecial(ITEM_OBTAINED,MINI_TUNING_FORK_OF_ICE);
		end
	elseif(csid == 0x02de and option == 1) then
		toCloisterOfFrost(player);
	end
	
end;