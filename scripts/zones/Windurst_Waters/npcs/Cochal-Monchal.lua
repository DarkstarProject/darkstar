-----------------------------------
-- Area: Windurst Waters
-- NPC:  Cochal-Monchal
-- Involved in Quest: Dark Legacy
-- @zone 238
-- @pos -52 -6 110
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
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
	
	if (player:getVar("darkLegacyCS") == 2) then
		player:startEvent(0x02b9,0,DARKSTEEL_FORMULA);
	elseif (player:getVar("darkLegacyCS") == 3) then
		player:startEvent(0x02ba,0,DARKSTEEL_FORMULA);
	elseif (player:hasKeyItem(DARKSTEEL_FORMULA)) then
		player:startEvent(0x02bb,0,DARKSTEEL_FORMULA);
	else
		player:startEvent(0x2b8);
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
	
	if (csid == 0x02b9) then
		player:setVar("darkLegacyCS",3);
		player:delKeyItem(LETTER_FROM_THE_DARKSTEEL_FORGE);
	end
	
end;