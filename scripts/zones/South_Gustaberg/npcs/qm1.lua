-----------------------------------
-- Area: South Gustaberg
-- NPC: ???
-- Involved in Quest: The Cold Light of Day
-----------------------------------

package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
require("scripts/zones/South_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
  	count = trade:getItemCount();
  	gil = trade:getGil();

  	if ((trade:hasItemQty(QUUS1,1) or trade:hasItemQty(QUUS2,1)) and count == 1 and gil == 0) then
		if(GetMobAction(BUBBLY_BERNIE) == 0) then
			SpawnMob(BUBBLY_BERNIE,288);
			player:tradeComplete();
		else
			player:messageSpecial(NOTHING_FOUND);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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
