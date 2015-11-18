-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  Telepoint
-- @pos 220.000 19.104 300.000 106
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local item = trade:getItem();

	if (trade:getItemCount() == 1 and item > 4095 and item < 4104) then	
		if (player:getFreeSlotsCount() > 0 and player:hasItem(613) == false) then
			player:tradeComplete();
			player:addItem(613);
			player:messageSpecial(ITEM_OBTAINED,613); -- Faded Crystal
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,613); -- Faded Crystal
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:hasKeyItem(DEM_GATE_CRYSTAL) == false) then
		player:addKeyItem(DEM_GATE_CRYSTAL);
		player:messageSpecial(KEYITEM_OBTAINED,DEM_GATE_CRYSTAL);
	else
		player:messageSpecial(ALREADY_OBTAINED_TELE);
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