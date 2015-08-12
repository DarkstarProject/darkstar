-----------------------------------
--  Area: Kazham
--  NPC: Dodmos
--  Starts Quest: Trial Size Trial By Fire
--  @pos 102.647 -14.999 -97.664 250
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/teleports");
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (trade:hasItemQty(1544,1) == true and player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_FIRE) == QUEST_ACCEPTED  and player:getMainJob() == JOB_SMN) then
		player:startEvent(0x011f,0,1544,0,20);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local TrialSizeFire = player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_FIRE);

	if (player:getMainLvl() >= 20 and player:getMainJob() == JOB_SMN and TrialSizeFire == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 2) then --Requires player to be Summoner at least lvl 20
		player:startEvent(0x011e,0,1544,0,20); 	--mini tuning fork, zone, level
	elseif (TrialSizeFire == QUEST_ACCEPTED) then
		local FireFork = player:hasItem(1544);
		
		if (FireFork == true) then 
			player:startEvent(0x0110); --Dialogue given to remind player to be prepared
		elseif (FireFork == false and tonumber(os.date("%j")) ~= player:getVar("TrialSizeFire_date")) then
			player:startEvent(0x0122,0,1544,0,20); --Need another mini tuning fork
		end
	elseif (TrialSizeFire == QUEST_COMPLETED) then
		player:startEvent(0x0121); --Defeated Avatar
	else
		player:startEvent(0x0113); --Standard dialogue
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
	if (csid == 0x011e and option == 1) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1544); --Mini tuning fork 
		else
			player:setVar("TrialSizeFire_date", 0);
			player:addQuest(OUTLANDS,TRIAL_SIZE_TRIAL_BY_FIRE);
			player:addItem(1544); 
			player:messageSpecial(ITEM_OBTAINED,1544); 
		end
	elseif (csid == 0x0122 and option == 1) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1544); --Mini tuning fork 
		else
			player:addItem(1544); 
			player:messageSpecial(ITEM_OBTAINED,1544); 
		end
	elseif (csid == 0x011f and option == 1) then
		toCloisterOfFlames(player);
	end	
end;

