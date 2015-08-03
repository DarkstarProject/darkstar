-----------------------------------
-- Area: Port Jeuno
-- NPC: Guddal
-- Starts and Finishes Quest: Kazham Airship Pass (This quest does not appear in your quest log)
-- @zone 246
-- @pos -14 8 44 
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:hasKeyItem(AIRSHIP_PASS_FOR_KAZHAM) == false) then 
		if (trade:hasItemQty(1024,1) == true and trade:hasItemQty(1025,1) == true and trade:hasItemQty(1026,1) == true and 
		   trade:getGil() == 0 and trade:getItemCount() == 3) then 
			player:startEvent(0x012d); -- Ending quest "Kazham Airship Pass"
		else
			player:startEvent(0x012e);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(AIRSHIP_PASS_FOR_KAZHAM) == false) then 
		player:startEvent(0x012c);
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x012c) then
		if (player:delGil(148000)) then
			player:addKeyItem(AIRSHIP_PASS_FOR_KAZHAM);
			player:updateEvent(0,1);
		end
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x012c) then
		if (player:hasKeyItem(AIRSHIP_PASS_FOR_KAZHAM) == true) then
			player:messageSpecial(KEYITEM_OBTAINED,AIRSHIP_PASS_FOR_KAZHAM);
		end
	elseif (csid == 0x012d) then
		player:addKeyItem(AIRSHIP_PASS_FOR_KAZHAM);
		player:messageSpecial(KEYITEM_OBTAINED,AIRSHIP_PASS_FOR_KAZHAM);
		player:tradeComplete();
	end
end;



