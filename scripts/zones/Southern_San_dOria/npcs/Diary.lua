-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Diary
-- Involved in Quest: To Cure a Cough
-- @zone 230
-- @pos -75 -12 65
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	medicineWoman = player:getQuestStatus(SANDORIA,THE_MEDICINE_WOMAN);
	toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);
--	player:startEvent(0x02d2)  -- read page 4
--	player:startEvent(0x02d3) read last page
	if (toCureaCough == QUEST_AVAILABLE and player:getVar("DiaryPage") == 0) then
		player:startEvent(0x27F);  -- see diary, option to read
	elseif (player:getVar("DiaryPage") == 1) then
		player:startEvent(0x280);  -- diary page 2
	elseif (player:getVar("DiaryPage") >= 2 and medicineWoman == QUEST_COMPLETED) then
		player:startEvent(0x281);  -- read page 3
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

	if (csid == 0x027F and option == 0 ) then
		player:setVar("DiaryPage",1);	-- has read page 1
	elseif (csid == 0x280 and option == 1) then
		player:setVar("DiaryPage",1);	-- can read p2, but reads page 1 instead
	elseif (csid == 0x280 and option == 2) then
		player:setVar("DiaryPage",2);	-- has read page 2
	elseif (csid == 0x281) then
		player:setVar("DiaryPage",3);	-- has read page 3
	end

end;
