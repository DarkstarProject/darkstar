-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- NPC:  ??? (Spawn Ob(ZNM T1))
-- @pos 542 0 -129 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (trade:hasItemQty(2592,1) and trade:getItemCount() == 1) then -- Trade Coq Lubricant
		player:tradeComplete();
		SpawnMob(17072171,180):updateClaim(player);
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