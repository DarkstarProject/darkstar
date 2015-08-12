-----------------------------------
--  Area: Uleguerand_Range
--   NPC: Geush Urvan
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Uleguerand_Range/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade  Haunted Muleta
	if (GetMobAction(16798078) == 0 and trade:hasItemQty(1824,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(16798078,1800):updateClaim(player); -- Geush Urvan
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;