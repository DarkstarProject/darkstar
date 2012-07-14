-----------------------------------
-- Area: Gusgen Mines
-- NPC:  qm2 (???)
-- Involved In Mission: Bastok 3-2
-- @zone 196
-- @pos 206 -60 -101
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Gusgen_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getCurrentMission(BASTOK) == TO_THE_FORSAKEN_MINES and player:hasItem(563) == false) then
		if(trade:hasItemQty(4358,1) and trade:getItemCount() == 1) then -- Trade Hare Meat
			player:tradeComplete();
			SpawnMob(17580038,300):updateEnmity(player);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;