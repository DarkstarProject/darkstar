-----------------------------------
--	Area: Lower Jeuno
-- 	Door: Merchant's House
-- 	Starts & Finishes Quest: Save My Son
--  Optional Involvement in Quest: Chocobo's Wounds, Path of the Beastmaster
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
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
	ChocobosWounds = player:getQuestStatus(JEUNO, CHOCOBO_S_WOUNDS)

	if (ChocobosWounds == 0) then
		player:startEvent(0x0040);
	elseif (player:getVar("ChocobosWounds_Event") > 3) then
		player:startEvent(0x003f);
	elseif (player:getQuestStatus(JEUNO, SAVE_MY_SON) == 0 and ChocobosWounds == 2) then
		player:startEvent(0x00a4);
	elseif (player:getQuestStatus(JEUNO, SAVE_MY_SON) == 1) then
		SaveMySon = player:getVar("SaveMySon_Event");

		if (SaveMySon == 0) then
			player:startEvent(0x00e5);
		elseif (SaveMySon == 1) then
			player:startEvent(0x00a3);
		end
	elseif (player:needToZone() == false and player:getQuestStatus(JEUNO, SAVE_MY_SON) == 2) then
		player:startEvent(0x0084);
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

	if (csid == 0x00a4 and option == 0) then
		player:addQuest(JEUNO, SAVE_MY_SON);
	elseif (csid == 0x00a3) then
		if (player:getFreeSlotsCount(0) >= 1) then
			player:setTitle(LIFE_SAVER);
			player:addItem(BEAST_WHISTLE);
			player:messageSpecial(ITEM_OBTAINED, BEAST_WHISTLE);
			player:addGil(GIL_RATE*2100);
			player:messageSpecial(GIL_OBTAINED, GIL_RATE*2100);
			player:setVar("SaveMySon_Event",0);
			player:needToZone(true);
			player:completeQuest(JEUNO, SAVE_MY_SON);
		else
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, BEAST_WHISTLE);
		end
	end
end;