-----------------------------------
-- Area: Bhaflau Thickets
-- NPC: Kamih Mapokhalam
-- 
-----------------------------------

require("scripts/zones/Bhaflau_Thickets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

SilverCoin  = 2158;
MythrilCoin = 2186;

count = trade:getItemCount();

	if (count == 1 and trade:hasItemQty(SilverCoin,1)) then
		player:tradeComplete();
		player:startEvent(0x0079);
	elseif (count == 3 and trade:hasItemQty(MythrilCoin,3)) then
		if (player:hasKeyItem(1865)) then
			player:startEvent(0x0093); 
		else
			player:tradeComplete();
			player:addKeyItem(1865);
			player:startEvent(0x0092);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getZPos() < 597) then
		player:startEvent(0x0078);
	else
		player:startEvent(0x007A);
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
	if (csid == 0x0079) then
		player:setPos(325,-4,-620,0,72);
	elseif (csid == 0x0092) then
		player:specialMessage(KEYITEM_OBTAINED,1865);
	end
end;