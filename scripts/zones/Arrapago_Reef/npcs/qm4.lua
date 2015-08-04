-----------------------------------
-- Area: Arrapago Reef
-- NPC:  ??? (Spawn Nuhn(ZNM T3))
-- @pos -451 -7 389 54 
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Arrapago_Reef/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (trade:hasItemQty(2596,1) and trade:getItemCount() == 1) then -- Trade Rose Scampi
		player:tradeComplete();
		SpawnMob(16998874,180):updateClaim(player);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_HAPPENS);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;