-----------------------------------
--	Area: Windurst Waters
--	NPC:  Naiko-Paneiko
--  Involved In Quest: Making Headlines
--	Working 100%
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
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
	if (MakingHeadlines == 0) then
		player:startEvent(0x0299); -- Quest Start
	elseif (MakingHeadlines == 1) then
		prog = player:getVar("QuestMakingHeadlines_var"); 
		-- 	Variable to track if player has talked to 4 NPCs and a door
		-- 	1 = Kyume
		--	2 = Yujuju
		--	4 = Hiwom
		--	8 = Umumu
		--	16 = Mahogany Door
		if (testflag(tonumber(prog),1) == false or testflag(tonumber(prog),2) == false or testflag(tonumber(prog),4) == false or testflag(tonumber(prog),8) == false) then
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x029a); -- Quest Reminder 1
			else
				player:startEvent(0x029f); -- Quest Reminder 2
			end			
		elseif (testflag(tonumber(prog),8) == true and testflag(tonumber(prog),16) == false) then
			player:startEvent(0x02a1); -- Advises to validate story
		elseif (prog == 31) then
			rand = math.random(1,2);
			if (rand == 1) then
				player:startEvent(0x02a2); -- Quest finish 1
			elseif (scoop == 4 and door == 1) then
				player:startEvent(0x029e);	-- Quest finish 2
			end
		end
	else
		player:startEvent(0x0297); -- Standard conversation
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
	if (csid == 0x0299) then
		player:addQuest(WINDURST,MAKING_HEADLINES);
	elseif (csid == 0x029e or csid == 0x02a2) then
		player:completeQuest(WINDURST,MAKING_HEADLINES);
		player:setTitle(EDITORS_HATCHET_MAN);
		player:addFame(WINDURST,WIN_FAME*120);
		player:addGil(GIL_RATE*560);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*560);	
		player:delKeyItem(WINDURST_WOODS_SCOOP);
		player:delKeyItem(WINDURST_WALLS_SCOOP);
		player:delKeyItem(WINDURST_WATERS_SCOOP);
		player:delKeyItem(PORT_WINDURST_SCOOP);
		player:setVar("QuestMakingHeadlines_var",0);
	end
end;



