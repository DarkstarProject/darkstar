-----------------------------------
-- Area: Misareaux_Coast
-- NPC:  ??? (Spawn Gration)
-- @pos 113.563 -16.302 38.912 25
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Misareaux_Coast/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Hickory Shield OR Picaroon's Shield
	if (GetMobAction(16879899) == 0 and (trade:hasItemQty(12370,1) or trade:hasItemQty(12359,1)) and trade:getItemCount() == 1) then
	  	player:tradeComplete();
		SpawnMob(16879899,900):updateClaim(player);
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