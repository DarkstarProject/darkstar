-----------------------------------
--	Area: Port Windurst
--	NPC:  Yujuju
--  Involved In Quest: Making Headlines
--  @pos 201.523 -4.785 138.978 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Port_Windurst/TextIDs");

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
	
	local MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
	local WildcatWindurst = player:getVar("WildcatWindurst");

	if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,19) == false) then
		player:startEvent(0x026d);
	elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")==9) then
		player:startEvent(0x0250);--COP event
	elseif (MakingHeadlines == 1) then
		local prog = player:getVar("QuestMakingHeadlines_var");
		-- 	Variable to track if player has talked to 4 NPCs and a door
		-- 	1 = Kyume
		--	2 = Yujuju
		--	4 = Hiwom
		--	8 = Umumu
		--	16 = Mahogany Door
		if (testflag(tonumber(prog),2) == false) then
			player:startEvent(0x013a); -- Get Scoop
		else
			player:startEvent(0x013b); -- After receiving scoop
		end
	else
		player:startEvent(0x0154); -- Standard Conversation
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
	if (csid == 0x013a) then
		prog = player:getVar("QuestMakingHeadlines_var");
		player:addKeyItem(PORT_WINDURST_SCOOP);
		player:messageSpecial(KEYITEM_OBTAINED,PORT_WINDURST_SCOOP);
		player:setVar("QuestMakingHeadlines_var",prog+2);
	elseif (csid == 0x0250)	then
		player:setVar("MEMORIES_OF_A_MAIDEN_Status",10);
	elseif (csid == 0x026d) then
		player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",19,true);
	end	
end;



