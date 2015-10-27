-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Sozu Rogberry NM)
-- @pos  159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Flickering Lantern 
	if (trade:hasItemQty(2387,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17428751,300):updateClaim(player);
		-- Note: The ??? reappears after 15 minutes
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;