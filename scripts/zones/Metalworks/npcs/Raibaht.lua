-----------------------------------
-- Area: Metalworks
-- NPC: Raibaht
-- Involved in Quest: The Usual
-----------------------------------

require("scripts/globals/keyitems");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(BASTOK,THE_USUAL) == 1 and player:hasKeyItem(STEAMING_SHEEP_INVITATION) and player:getVar("TheUsual_Event") ~= 1) then
		player:startEvent(0x01fe);
	else
		player:startEvent(0x01f5);
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

	if (csid == 0x01fe and option == 0) then
		player:setVar("TheUsual_Event",1);
	end

end;
