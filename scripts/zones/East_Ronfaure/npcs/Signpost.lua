-----------------------------------
-- Area: East Ronfaure
-- NPC:  Signpost
-- Involved in Quest: To Cure a Cough
-- @pos 257 -45 212 101
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/East_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(npc:getID() == 17191469 and (player:hasKeyItem(SCROLL_OF_TREASURE) == true)) then
		player:startEvent(20);
		player:delKeyItem(SCROLL_OF_TREASURE);
		player:addGil(GIL_RATE*3000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
	elseif(npc:getID() == 17191469) then
		player:startEvent(5);
	elseif(npc:getID() == 17191468) then
		player:startEvent(3);
	elseif(npc:getID() == 17191470) then
		player:startEvent(7);
	elseif(npc:getID() == 17191471) then
		player:startEvent(9);
	elseif(npc:getID() == 17191472) then
		player:startEvent(11);
	elseif(npc:getID() == 17191473) then
		player:startEvent(13);									
	elseif(npc:getID() == 17191474) then
		player:startEvent(15);		
	elseif(npc:getID() == 17191475) then
		player:startEvent(17);				
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
end;