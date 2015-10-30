-----------------------------------
-- Area: Meriphataud Mountains
-- NPC: qm1 (???)
-- Involved in Quest: The Holy Crest
-- @pos 641 -15 7 119
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Meriphataud_Mountains/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (trade:hasItemQty(1159,1) and trade:getItemCount() == 1) then
		if (player:getVar("TheHolyCrest_Event") == 4) then
			player:startEvent(0x0038);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_FOUND);
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

	if (csid == 0x0038) then
		player:tradeComplete();
		player:setVar("TheHolyCrest_Event",5);
		player:startEvent(0x0021);
	end
	
end;