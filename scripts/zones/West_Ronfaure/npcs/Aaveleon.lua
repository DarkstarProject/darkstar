-----------------------------------
--	Area: West Ronfaure
--	NPC:  Aaveleon
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL) == 1) then
		count = trade:getItemCount();
		Ointment = trade:hasItemQty(600,1);
		if (Ointment == true and count == 1) then
			player:tradeComplete();
			player:addItem(601);
			player:startEvent(0x0064);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0065);
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
	if (csid == 0x0064) then
		player:messageSpecial(ITEM_OBTAINED,601);
	end
end;



