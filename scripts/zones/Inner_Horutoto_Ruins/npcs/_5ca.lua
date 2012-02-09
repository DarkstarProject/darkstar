-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Mahogany Door
--  Involved In Quest: Making Headlines
--	Working 100%
--  Unable to find EventID for Making Headlines quest. Used dialog ID instead.
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
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
		windurst_mission_2_1 = player:getVar("windurst_mission_2_1");
		if(windurst_mission_2_1 == 5) then
			player:startEvent(0x2e); -- "The door is firmly shut"
		else
			player:startEvent(0x2c); -- "The door is firmly shut"
		end
		return 1;
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
		return 1;
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

	if(csid == 0x2e) then
		-- Mark the progress
		player:setVar("windurst_mission_2_1",6);
	end
end;



