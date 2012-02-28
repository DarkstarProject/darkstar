-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Aldo
-- Involved in Mission: Magicite
-- @zone 245
-- @pos 20 3 -58
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
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
	
	if(player:hasKeyItem(LETTERS_TO_ALDO)) then
		player:startEvent(0x0098);
	elseif(player:getCurrentMission(player:getNation()) == 13 and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x00B7);
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
	
	if(csid == 0x0098) then
		player:delKeyItem(LETTERS_TO_ALDO);
		player:addKeyItem(SILVER_BELL);
		player:messageSpecial(KEYITEM_OBTAINED,SILVER_BELL);
		player:setVar("MissionStatus",3);
	end
	
end;