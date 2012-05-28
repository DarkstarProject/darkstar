-----------------------------------
-- Area: Rabao
-- NPC: Rahi Fohlatti
-- Starts Quest: Trial Size Trial by Wind
-- @Zone 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	TrialSizeWind = player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WIND);
	
	if(trade:hasItemQty(1546,1) == true and TrialSizeWind == QUEST_ACCEPTED) then
		player:startEvent(0x006d,0,1546,3,20);
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TrialSizeWind = player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WIND);
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	realday = tonumber(os.date("%j"));

	if(mLvl >= 20 and mJob == 15 and TrialSizeWind == QUEST_AVAILABLE and player:getFameLevel(RABAO) >= 2) then --Requires player to be Summoner at least lvl 20
		player:startEvent(0x006c,0,1546,3,20); 	--mini tuning fork, zone, level
	elseif(TrialSizeWind == QUEST_ACCEPTED) then
		WindFork = player:hasItem(1546);
		
		if(WindFork == true) then 
			player:startEvent(0x0044); --Dialogue given to remind player to be prepared
		elseif(WindFork == false and realday ~= player:getVar("TrialSizeWind_date")) then
			player:startEvent(0x0070,0,1546,3,20); --Need another mini tuning fork
		end
	elseif(TrialSizeWind == QUEST_COMPLETED) then
		player:startEvent(0x006f); --Defeated Avatar
	else
		player:startEvent(0x0047); --Standard dialogue
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
	if(csid == 0x006c and option == 1) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1546); --Mini tuning fork 
		else
			player:setVar("TrialSizeWind_date", 0);
			player:addQuest(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WIND);
			player:addItem(1546); 
			player:messageSpecial(ITEM_OBTAINED,1546); 
		end
	elseif(csid == 0x0070 and option == 1) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1546); --Mini tuning fork 
		else
			player:addItem(1546); 
			player:messageSpecial(ITEM_OBTAINED,1546); 
		end
	elseif(csid == 0x006d and option == 1) then
		player:setPos(-399,0,-420,252,201);
	end	
end;



