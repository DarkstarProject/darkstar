-----------------------------------
-- Area: Port Jeuno
-- NPC: Sagheera
-- @zone 246
-- @pos -3 0 -9
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local WildcatJeuno = player:getVar("WildcatJeuno");
	if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == 1 and player:getMaskBit(WildcatJeuno,19) == false) then
		player:startEvent(313);
	else
		player:startEvent(0x0136); -- Standard dialog
	end
end; 

-- 0x0136 0x0137 0x0138 0x0139

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
	if (csid == 313) then
		player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",19,true)
	end
end;
