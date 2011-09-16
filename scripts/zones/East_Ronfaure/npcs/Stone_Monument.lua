-----------------------------------
--  Area: East Ronfaure
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-----------------------------------

require("scripts/zones/East_Ronfaure/TextIDs");

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0384);
end;

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

clay = trade:hasItemQty(570,1);
count = trade:getItemCount();

	if (count == 1 and clay) then
		player:tradeComplete();
		player:addItem(570);
		player:specialMessage(ITEM_OBTAINED,570);
		player:setVar("anExplorer-CurrentTablet",0x00002);
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
end;