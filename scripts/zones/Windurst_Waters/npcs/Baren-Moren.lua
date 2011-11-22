-----------------------------------
--	Area: Windurst Waters
--	NPC:  Baren-Moren
--	Starts and Finishes Quest: Hat in Hand
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
	hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
	if (hatstatus == 0) then
		player:startEvent(0x0030); -- Quest Offered
	elseif (hatstatus == 1) then
		prog = player:getVar("QuestHatInHand_var");
		-- 	Variable to track quest progress
		-- 	1 = Machitata
		--	2 = Honoi-Gomoi
		--	4 = Kenapa-Keppa
		--	8 = Clais
		--	16 = Kyume-Romeh
		--  32 = Tosuka-Porika
		--  64 = Pechiru-Mashiru 
		--  128 = Bondada
		count = player:getVar("QuestHatInHand_count");
		if (count == 8) then 				-- Finishes Quest - HAT + FULL REWARD
			player:startEvent(0x0034,80); 
		elseif (count >= 5) then			-- Finishes Quest - HAT + GOOD REWARD
			player:startEvent(0x0034,50); 
		elseif (count >= 3) then			-- Finishes Quest - PARTIAL REWARD
			player:startEvent(0x0034,30); 
		elseif (count >= 2) then			-- Finishes Quest - POOR REWARD
			player:startEvent(0x0034,20); 
		elseif (count == 1) then			-- Finishes Quest - NO REWARD
			player:startEvent(0x0034); 
		else								-- Quest Objective Reminder
			player:startEvent(0x0033); 
		end
	else
		rand = math.random(1,12);
		if (rand <= 3 ) then
			player:startEvent(0x0030); -- Repeatable Quest "Hat In Hand" offered
		elseif (rand >= 4 and rand <= 6) then
			player:startEvent(0x0223); -- Quest "Feather In One's Cap" offered
		elseif (rand == 7) then
			player:startEvent(0x002a); -- Standard Conversation 1
		elseif (rand == 8) then
			player:startEvent(0x002c); -- Standard Conversation 2
		elseif (rand == 9) then
			player:startEvent(0x002d); -- Standard Conversation 3		
		elseif (rand == 10) then
			player:startEvent(0x002e); -- Standard Conversation 4			
		elseif (rand == 11) then
			player:startEvent(0x002f); -- Standard Conversation 5		
		elseif (rand == 12) then
			player:startEvent(0x03fe); -- Standard Conversation 6				
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
printf("CSID: %u",csid);
printf("RESULT: %u",option);
	if (csid == 0x0030 and option == 1) then
		player:addQuest(WINDURST,HAT_IN_HAND);
	elseif (csid == 0x0034 and option >= 4 and player:getFreeSlotsCount(0) == 0) then
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12543);
	elseif (csid == 0x0034 and option >= 2) then		
		if (option == 5) then -- Finishes Quest - HAT + FULL REWARD
			player:addGil(GIL_RATE*500);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*500);
			player:addItem(12543,1);
			player:messageSpecial(ITEM_OBTAINED,12543);
		elseif (option == 4) then -- Finishes Quest - HAT + GOOD REWARD	
			player:addGil(GIL_RATE*400);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);
			player:addItem(12543,1);
			player:messageSpecial(ITEM_OBTAINED,12543);
		elseif (option == 3) then -- Finishes Quest - PARTIAL REWARD	
			player:addGil(GIL_RATE*300);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
		elseif (option == 2) then -- Finishes Quest - POOR REWARD
			player:addGil(GIL_RATE*150);
			player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
		end
		if (hatstatus == 1) then
			player:addFame(WINDURST,WIN_FAME*100);	
		else
			player:addFame(WINDURST,WIN_FAME*10);
		end
		player:completeQuest(WINDURST,HAT_IN_HAND);
		count = player:setVar("QuestHatInHand_count",0);
		prog = player:setVar("QuestHatInHand_var",0);
	end
end;



