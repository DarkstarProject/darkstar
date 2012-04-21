-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  qm7  (???)
-- Involved In Mission: Notorious Monster : Death From Above
-- @zone 159
-- @pos 53 1 -32 (71)
-- 
-- Note: ??? needs to Dissapear for 15 min
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
				SpawnMob(17428810,300):updateEnmity(player);
		end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(IT_IS_A_BEEHIVE);
end;
