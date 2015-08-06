-----------------------------------
-- Area: Xarcabard
-- NPC:  Telepoint
-- @pos 150.258 -21.047 -37.256 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	item = trade:getItem();

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
	
	if (player:hasKeyItem(VAHZL_GATE_CRYSTAL) == false) then
		player:addKeyItem(VAHZL_GATE_CRYSTAL);
		player:messageSpecial(KEYITEM_OBTAINED,VAHZL_GATE_CRYSTAL);
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