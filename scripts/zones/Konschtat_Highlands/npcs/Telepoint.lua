-----------------------------------
-- Area: Konschtat Highlands
-- NPC: Telepoint
-- 
-----------------------------------

require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

item = trade:getItem();

if (trade:getItemCount() == 1 and item > 4095 and item < 4104) then	
	if (player:getFreeSlotsCount() > 0 and not(player:hasItem(613))) then
		player:tradeComplete();
		player:addItem(613);
		player:messageSpecial(ITEM_OBTAINED,613);
	else
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,613);
	end
end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(353) == false) then
		player:addKeyItem(353);
		player:messageSpecial(KEYITEM_OBTAINED,353);
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