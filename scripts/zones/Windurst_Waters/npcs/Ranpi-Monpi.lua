-----------------------------------
--	Area: Windurst Waters
--	NPC:  Ranpi-Monpi
--	Starts and Finished Quest: A Crisis in the Making
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
--	player:delQuest(WINDURST,A_CRISIS_IN_THE_MAKING);
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end
	crisisstatus = player:getQuestStatus(WINDURST,A_CRISIS_IN_THE_MAKING);
	pfame = player:getFameLevel(WINDURST);
	if (crisisstatus == 0 and pfame >= 2) then
		player:startEvent(0x0102,0,625); -- A Crisis in the Making + ITEM: Quest Offer
	elseif (crisisstatus == 1 and player:getVar("QuestCrisisMaking_var") == 0) then
		player:startEvent(0x0106,0,625); -- A Crisis in the Making: Quest Objective Reminder
	elseif (crisisstatus == 1 and player:getVar("QuestCrisisMaking_var") == 1) then
		player:startEvent(0x010b); -- A Crisis in the Making: Quest Finish
	elseif (crisisstatus == 2 and player:getVar("QuestCrisisMaking_var") == 0) then
		rand = math.random(1,6);
		if (rand <= 3) then
			player:startEvent(0x0103,0,625); -- A Crisis in the Making + ITEM: Repeatable Quest Offer
		elseif (rand == 4) then
			player:startEvent(0x00f9); -- STANDARD CONVO: sings song about engredients
		elseif (rand == 5) then
			player:startEvent(0x00fb); -- STANDARD CONVO 2: sings song about engredients
		elseif (rand == 6) then
			player:startEvent(0x0100); -- STANDARD CONVO 3:
		end
	elseif (crisisstatus == 2 and player:getVar("QuestCrisisMaking_var") == 1) then
		player:startEvent(0x010c); -- A Crisis in the Making: Repeatable Quest Finish
	else
		rand = math.random(1,3);
		if (rand == 1) then
			player:startEvent(0x00f9); -- STANDARD CONVO: sings song about engredients
		elseif (rand == 2) then
			player:startEvent(0x00fb); -- STANDARD CONVO 2: sings song about engredients
		elseif (rand == 3) then
			player:startEvent(0x0100); -- STANDARD CONVO 3:
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
	if (csid == 0x0102 and option == 1) then
		player:addQuest(WINDURST,A_CRISIS_IN_THE_MAKING);
		player:setVar("QuestCrisisMaking_var",1);
	elseif (csid == 0x010b) then -- A Crisis in the Making: Quest Finish
		player:addGil(GIL_RATE*400);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);		
		player:setVar("QuestCrisisMaking_var",0);
		player:delKeyItem(39,OFF_OFFERING);	
		player:addFame(WINDURST,WIN_FAME*75);
		player:completeQuest(WINDURST,A_CRISIS_IN_THE_MAKING);	
	elseif (csid == 0x010c) then -- A Crisis in the Making: Repeatable Quest Finish
		player:addGil(GIL_RATE*400);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);		
		player:setVar("QuestCrisisMaking_var",0);
		player:delKeyItem(39,OFF_OFFERING);
		player:addFame(WINDURST,WIN_FAME*8);
	end
end;
