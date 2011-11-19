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
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end
	MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
	if (MakingHeadlines == 1) then
		prog = player:getVar("QuestMakingHeadlines_var");
		-- 	Variable to track if player has talked to 4 NPCs and a door
		-- 	1 = Kyume
		--	2 = Yujuju
		--	4 = Hiwom
		--	8 = Umumu
		--	16 = Mahogany Door
		if (testflag(tonumber(prog),16) == false and testflag(tonumber(prog),8) == true) then
			player:messageSpecial(7208,1); -- Confirm Story
			player:setVar("QuestMakingHeadlines_var",prog+16);
		else
			player:startEvent(0x002c); -- "The door is firmly shut"
		end
	else
		player:startEvent(0x002c); -- "The door is firmly shut"
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
end;



