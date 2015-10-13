-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  Telepoint
-----------------------------------
package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Eastern_Altepa_Desert/TextIDs");

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
	
	if (player:hasKeyItem(ALTEPA_GATE_CRYSTAL) == false) then
		player:addKeyItem(ALTEPA_GATE_CRYSTAL);
		player:messageSpecial(KEYITEM_OBTAINED,ALTEPA_GATE_CRYSTAL);
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