-----------------------------------
-- Area: Port Bastok
-- NPC:  Ferrol
-- Starts Quest: Trial Size Trial by Earth
-- @pos 33.708 6.499 -39.425 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	TrialSizeEarth = player:getQuestStatus(BASTOK,TRIAL_SIZE_TRIAL_BY_EARTH);
	
	if(trade:hasItemQty(1547,1) and TrialSizeEarth == QUEST_ACCEPTED and player:getMainJob() == 15) then
		player:startEvent(0x012a,0,1547,1,20);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	TrialSizeEarth = player:getQuestStatus(BASTOK,TRIAL_SIZE_TRIAL_BY_EARTH);
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	realday = tonumber(os.date("%j"));

	if(mLvl >= 20 and mJob == 15 and TrialSizeEarth == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 2) then -- Requires player to be Summoner at least lvl 20
		player:startEvent(0x0129,0,1547,1,20); 	--mini tuning fork, zone, level
	elseif(TrialSizeEarth == QUEST_ACCEPTED) then
		EarthFork = player:hasItem(1547);
		
		if(EarthFork) then 
			player:startEvent(0x00fb); -- Dialogue given to remind player to be prepared
		elseif(EarthFork == false and realday ~= player:getVar("TrialSizeEarth_date")) then
			player:startEvent(0x012d,0,1547,1,20); -- Need another mini tuning fork
		else
			player:startEvent(0x012f); -- Standard dialog when you loose, and you don't wait 1 real day
		end
	elseif(TrialSizeEarth == QUEST_COMPLETED) then
		player:startEvent(0x012c); -- Defeated Avatar
	else
		player:startEvent(0x00fe); -- Standard dialog
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
	
	if(csid == 0x0129 and option == 1) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1547); --Mini tuning fork 
		else
			player:addQuest(BASTOK,TRIAL_SIZE_TRIAL_BY_EARTH);
			player:addItem(1547); 
			player:messageSpecial(ITEM_OBTAINED,1547); 
		end
	elseif(csid == 0x012d and option == 1) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1547); --Mini tuning fork 
		else
			player:addItem(1547); 
			player:messageSpecial(ITEM_OBTAINED,1547); 
		end
	elseif(csid == 0x012a and option == 1) then
		player:setPos(-636,-14,-500,254,209);
	end
	
end;