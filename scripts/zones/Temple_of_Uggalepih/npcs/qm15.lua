-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Death From Above NM)
-- Involved In Mission: Death From Above
-- @pos 58 1 -70 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(trade:hasItemQty(1267,1) and trade:getItemCount() == 1) then -- Trade Bee Larvae
		player:tradeComplete();
		-- Note: ??? needs to Dissapear for 15 min
		SpawnMob(17428810,300):updateEnmity(player);
	else
		player:messageSpecial(NOTHING_HAPPENS);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NM_OFFSET + 4);
end;