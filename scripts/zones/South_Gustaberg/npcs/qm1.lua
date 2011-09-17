-----------------------------------
-- Area: South Gustaberg
-- NPC: ???
-- Involved in Quest: The Cold Light of Day
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/South_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
  	count = trade:getItemCount();
  	gil = trade:getGil();
  	quusTraded = trade:hasItemQty(QUUS,1)

  	if (quusTraded == true and count == 1 and gil == 0) then
		SpawnMOBByID(BUBBLY_BERNIE);
		player:tradeComplete();
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
