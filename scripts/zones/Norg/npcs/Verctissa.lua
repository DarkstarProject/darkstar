-----------------------------------
-- Area: Norg
-- NPC:  Verctissa
-- Starts Quest: Trial Size Trial By Water
-- @pos -13 1 -20 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(1549,1) and player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WATER) == QUEST_ACCEPTED) then
		player:startEvent(0x00c8,0,1549,2,20);
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local TrialSizeWater = player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WATER);
	local mLvl = player:getMainLvl();
	local mJob = player:getMainJob();
	local realday = tonumber(os.date("%j"));

	if(mLvl >= 20 and mJob == 15 and TrialSizeWater == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 2) then --Requires player to be Summoner at least lvl 20
		player:startEvent(0x00c7,0,1549,2,20); 	--mini tuning fork of water, zone, level
	elseif(TrialSizeWater == QUEST_ACCEPTED) then
		WaterFork = player:hasItem(1549);
		
		if(WaterFork) then 
			player:startEvent(0x006f); --Dialogue given to remind player to be prepared
		elseif(WaterFork == false and realday ~= player:getVar("TrialSizeWater_date")) then
			player:startEvent(0x00cb,0,1549,2,20); --Need another mini tuning fork
		end
	elseif(TrialSizeWater == QUEST_COMPLETED) then
		player:startEvent(0x00ca); --Defeated Avatar
	else
		player:startEvent(0x0072); --Standard dialogue
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
	
	if(csid == 0x00c7 and option == 1) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1549); --Mini tuning fork 
		else
			player:setVar("TrialSizeWater_date", 0);
			player:addQuest(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WATER);
			player:addItem(1549); 
			player:messageSpecial(ITEM_OBTAINED,1549); 
		end
	elseif(csid == 0x00cb and option == 1) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1549); --Mini tuning fork 
		else
			player:addItem(1549); 
			player:messageSpecial(ITEM_OBTAINED,1549); 
		end
	elseif(csid == 0x00c8 and option == 1) then
		player:setPos(564,36,500,250,211);
	end
	
end;