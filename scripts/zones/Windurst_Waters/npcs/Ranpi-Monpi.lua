-----------------------------------
--	Area: Windurst Waters
--	NPC:  Ranpi-Monpi
--	Starts and Finished Quest: A Crisis in the Making
--	Working 100%
--  @zone = 238
--  @pos = -116 -3 52  (outside the shop he is in)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");	
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
	crisisstatus = player:getQuestStatus(WINDURST,A_CRISIS_IN_THE_MAKING);
	if (crisisstatus == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2 and player:needToZone() == false) then -- A Crisis in the Making + ITEM: Quest Offer
		player:startEvent(0x0102,0,625); 
	elseif (crisisstatus == QUEST_ACCEPTED) then
		prog = player:getVar("QuestCrisisMaking_var");
		if (prog == 1) then -- A Crisis in the Making: Quest Objective Reminder
			player:startEvent(0x0106,0,625); 
		elseif (prog == 2) then -- A Crisis in the Making: Quest Finish
			player:startEvent(0x010b); 
		end
	elseif (crisisstatus == QUEST_COMPLETED and player:needToZone() == false and player:getVar("QuestCrisisMaking_var") == 0) then  -- A Crisis in the Making + ITEM: Repeatable Quest Offer
		player:startEvent(0x0103,0,625); 
	elseif (crisisstatus == QUEST_COMPLETED and player:getVar("QuestCrisisMaking_var") == 1) then  -- A Crisis in the Making: Quest Objective Reminder
		player:startEvent(0x0106,0,625); 
	elseif (crisisstatus == QUEST_COMPLETED and player:getVar("QuestCrisisMaking_var") == 2) then -- A Crisis in the Making: Repeatable Quest Finish
		player:startEvent(0x010c); 
	else
		rand = math.random(1,3);
		if (rand == 1) then  -- STANDARD CONVO: sings song about engredients
			player:startEvent(0x00f9); 
		elseif (rand == 2) then   -- STANDARD CONVO 2: sings song about engredients
			player:startEvent(0x00fb);
		elseif (rand == 3) then   -- STANDARD CONVO 3:
			player:startEvent(0x0100);
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
	if (csid == 0x0102 and option == 1) then  -- A Crisis in the Making + ITEM: Quest Offer - ACCEPTED
		player:addQuest(WINDURST,A_CRISIS_IN_THE_MAKING);
		player:setVar("QuestCrisisMaking_var",1);
		player:needToZone(true);		
	elseif (csid == 0x0102 and option == 2) then  -- A Crisis in the Making + ITEM: Quest Offer - REFUSED
		player:needToZone(true);
	elseif (csid == 0x0103 and option == 1) then  -- A Crisis in the Making + ITEM: Repeatable Quest Offer - ACCEPTED
		player:setVar("QuestCrisisMaking_var",1);
		player:needToZone(true);		
	elseif (csid == 0x0103 and option == 2) then  -- A Crisis in the Making + ITEM: Repeatable Quest Offer - REFUSED
		player:needToZone(true);
	elseif (csid == 0x010b) then -- A Crisis in the Making: Quest Finish
		player:addGil(GIL_RATE*400);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);		
		player:setVar("QuestCrisisMaking_var",0);
		player:delKeyItem(39,OFF_OFFERING);	
		player:addFame(WINDURST,WIN_FAME*75);
		player:completeQuest(WINDURST,A_CRISIS_IN_THE_MAKING);
		player:needToZone(true);		
	elseif (csid == 0x010c) then -- A Crisis in the Making: Repeatable Quest Finish
		player:addGil(GIL_RATE*400);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);		
		player:setVar("QuestCrisisMaking_var",0);
		player:delKeyItem(39,OFF_OFFERING);
		player:addFame(WINDURST,WIN_FAME*8);
		player:needToZone(true);
	end
end;
