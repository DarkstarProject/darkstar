-----------------------------------
-- Area: Arrapago Reef
-- NPC:  ??? (Spawn Velionis(ZNM T1))
-- @pos 311 -3 27 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Arrapago_Reef/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (trade:hasItemQty(2600,1) and trade:getItemCount() == 1) then -- Trade Golden Teeth
		player:tradeComplete();
		SpawnMob(16998872,180):updateClaim(player);
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