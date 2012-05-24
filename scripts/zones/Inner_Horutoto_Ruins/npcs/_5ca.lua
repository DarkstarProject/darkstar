-----------------------------------
-- Area: Inner Horutoto Ruins
-- NPC:  Mahogany Door
-- Involved In Quest: Making Headlines
-- Involved in Mission 2-1
-- @pos -11 0 20 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Check for Missions first (priority?)
	if(player:getCurrentMission(WINDURST) == LOST_FOR_WORDS) then
		MissionStatus = player:getVar("MissionStatus");
		if(MissionStatus == 4) then
			player:startEvent(0x002e);
		else
			player:startEvent(0x002c); -- "The door is firmly shut"
		end
	else
		function testflag(set,flag)
			return (set % (2*flag) >= flag)
		end
		MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
		if (MakingHeadlines == 1) then
			prog = player:getVar("QuestMakingHeadlines_var");
			if (testflag(tonumber(prog),16) == false and testflag(tonumber(prog),8) == true) then
				player:messageSpecial(7208,1,WINDURST_WOODS_SCOOP); -- Confirm Story
				player:setVar("QuestMakingHeadlines_var",prog+16);
			else
				player:startEvent(0x002c); -- "The door is firmly shut"
			end
		else
			player:startEvent(0x002c); -- "The door is firmly shut"
		end
	end
	
	return 1;
	
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

	if(csid == 0x002e) then
		-- Mark the progress
		player:setVar("MissionStatus",5);
	end
	
end;