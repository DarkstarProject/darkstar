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

  	if ((trade:hasItemQty(4514,1) or trade:hasItemQty(5793,1)) and count == 1 and gil == 0) then
		if(GetMobAction(17215494) == 0) then
			SpawnMob(17215494,288);
			player:tradeComplete();
		else
			player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
