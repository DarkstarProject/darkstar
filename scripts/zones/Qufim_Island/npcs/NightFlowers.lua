-----------------------------------
-- Area: Qufim Island
-- NPC: Night Flowers
-- Involved in Quest: Save My Son (Beastmaster Flag #1)
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
require("scripts/zones/Qufim_Island/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	currentTime = VanadielHour();
	
	if (currentTime >= 22 or currentTime < 6) then
		if (player:getQuestStatus(JEUNO,SAVE_MY_SON) == 1 and player:getVar("SaveMySon_Event") == 0) then
			player:startEvent(0x0000);
		else
			player:messageSpecial(7265);
		end
	else
		player:messageSpecial(7264);
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

	if (csid == 0x0000) then
		player:setVar("SaveMySon_Event",1);
	end
end;



