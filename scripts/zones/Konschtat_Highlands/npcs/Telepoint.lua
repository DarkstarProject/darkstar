-----------------------------------
-- Area: Konschtat Highlands
-- NPC: Telepoint
--
-----------------------------------

package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)


	if (player:getCurrentMission(1) == 3) then
		count = trade:getItemCount();
		gil = trade:getGil();
		crystal = trade:getItem();

		if (trade:getItemQty(crystal, 1) and crystal > 4095 and crystal < 4104 and count == 1 and gil == 0) then
			if (player:getFreeSlotsCount(0) >= 1 and player:hasItem(FADED_CRYSTAL) == false) then
				player:tradeComplete();
				player:addItem(FADED_CRYSTAL);
				player:messageSpecial(ITEM_OBTAINED,FADED_CRYSTAL);
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,FADED_CRYSTAL);
			end
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



