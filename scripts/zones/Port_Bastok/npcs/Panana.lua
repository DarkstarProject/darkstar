-----------------------------------
-- Area: Port Bastok
-- NPC: Panana
-- Involved in Quest: Out of One's Shell
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

OutOfOneShell     = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);
OutOfOneShellZone = player:getVar("OutOfTheShellZone");

	if (OutOfOneShell == QUEST_ACCEPTED and OutOfOneShellZone == 0) then
		player:startEvent(0x0053);
	else
		player:startEvent(0x002b);	
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
end;



