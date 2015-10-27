-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Crimson-toothed Pawberry NM)
-- @pos -39 -24 27 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	respawn = GetServerVariable("[POP]Crimson-toothed_Pawberry");
	
	-- Trade Uggalepih Offering
	if (trade:hasItemQty(1183,1) and trade:getItemCount() == 1 and respawn <= os.time(t)) then 
		player:tradeComplete();
		SpawnMob(17428813,300):updateClaim(player);
		SpawnMob(17428815,300):updateClaim(player);
	else
		player:messageSpecial(NOTHING_HAPPENS);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NM_OFFSET + 1);
end;