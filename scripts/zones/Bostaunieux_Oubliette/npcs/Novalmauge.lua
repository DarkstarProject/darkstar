-----------------------------------
-- Area: Bostaunieux Obliette
-- NPC: Novalmauge
-- Involved in Quest: The Holy Crest
-----------------------------------

require("scripts/globals/quests");
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == 1) then
		TheHolyCrest = player:getVar("TheHolyCrest_Event");

		if (TheHolyCrest == 1) then
			player:startEvent(0x0006);
		elseif (TheHolyCrest == 2) then
			player:startEvent(0x0007);
		else
			player:startEvent(0x000a);
		end
	else
		player:startEvent(0x000a);
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

	if (csid == 0x0006) then
		player:setVar("TheHolyCrest_Event",2);
	end
end;
