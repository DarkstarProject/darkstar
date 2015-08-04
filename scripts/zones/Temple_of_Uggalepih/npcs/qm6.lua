-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Sacrificial Goblet NM)
-- @pos 300 1 255 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Uggalepih Whistle
	if (trade:hasItemQty(1184,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17428816,300):updateClaim(player);
	else
		player:messageSpecial(NOTHING_HAPPENS);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;