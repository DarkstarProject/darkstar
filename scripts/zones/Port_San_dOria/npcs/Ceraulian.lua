-----------------------------------
-- Area: Port San d'Oria
-- NPC: Ceraulian
-- Starts Quest: The Holy Crest
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == 0 and player:getMainLvl() >= 30) then
		player:startEvent(0x0018);
	else
		player:startEvent(0x024b);
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

	if (csid == 0x0018) then
		player:addQuest(SANDORIA,THE_HOLY_CREST);
		player:setVar("TheHolyCrest_Event",1);
	end
end;
