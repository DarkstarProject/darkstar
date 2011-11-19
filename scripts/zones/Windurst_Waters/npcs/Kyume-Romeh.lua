-----------------------------------
--	Area: Windurst Waters
--	NPC:  Kyume-Romeh
--  Involved In Quest: Making Headlines
--	Working 100%
--  Note: "Hat in Hand" quests should override active "Making Headlines" quest.
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

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
		if (testflag(tonumber(prog),1) == false) then
			player:startEvent(0x029c); -- Quest progress
		else
			player:startEvent(0x029d); -- Quest not furthered
		end
	else
		rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(0x025c); -- Standard Conversation
		else
			player:startEvent(0x0189); -- Standard Conversation
		end
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
	if (csid == 0x029c) then
		prog = player:getVar("QuestMakingHeadlines_var");
		player:addKeyItem(WINDURST_WATERS_SCOOP);
		player:messageSpecial(KEYITEM_OBTAINED,WINDURST_WATERS_SCOOP);	
		player:setVar("QuestMakingHeadlines_var",prog+1); 
	end
end;



