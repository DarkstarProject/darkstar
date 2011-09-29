-----------------------------------
--	Area: Lower Jeuno
-- 	Door: Merchant's House
-- 	Starts & Finishes Quest: Save My Son
--  Optional Involvement in Quest: Chocobo's Wounds, Path of the Beastmaster
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

ChoobosWounds = player:getQuestStatus(JEUNO, CHOCOBO_S_WOUNDS);
SaveMySon = player:getQuestStatus(JEUNO, SAVE_MY_SON);
PathOfTheBeastmaster = player:getQuestStatus(JEUNO, PATH_OF_THE_BEASTMASTER)
questStatus = player:getVar("SaveMySon_Event")

	if (player:getVar("ChocobosWounds_Event") > 3) then
		player:startEvent(0x003f);
	elseif (SaveMySon == 0 and ChoobosWounds == 2) then
		player:startEvent(0x00a4);
	elseif (SaveMySon == 1 and questStatus == 2) then
		player:startEvent(0x00a3);
	elseif (PathOfTheBeastmaster == 2) then
		player:startEvent(0x003c);
	else	
		player:startEvent(0x0040);
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

	if (csid == 0x00a4 and option == 0) then
		player:addQuest(JEUNO, SAVE_MY_SON);
		player:setVar("SaveMySon_Event",1);
	elseif (csid == 0x00a3) then
		player:completeQuest(JEUNO, SAVE_MY_SON);
		player:setTitle(LIFE_SAVER);
		player:addItem(13110); --Beast Whistle
		player:messageSpecial(ITEM_OBTAINED, 13110);
		player:addGil(2100);
		player:setVar("SaveMySon_Event",0);	
	end
end;