-----------------------------------
-- Area: Meriphataud Mountains
-- NPC: ???
-- Starts Quest: The Holy Crest
-----------------------------------

package.loaded["scripts/zones/Meriphataud_Mountains/TextIDs"] = nil;
require("scripts/zones/Meriphataud_Mountains/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil = trade:getGil();

	if (trade:hasItemQty(WYVERN_EGG,1) == true and count == 1 and gil == 0) then
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
		player:startEvent(0x0021)
	elseif (csid == 0x0021) then
		player:setVar("TheHolyCrest_Event",5);
	end
end;
