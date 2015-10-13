-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Genbu's Spawn)
-- Allows players to spawn the HNM Genbu with a Gem of the North and a Winterstone.
-- @pos 257 -70 517 130
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Gem of the North and Winterstone
	if (GetMobAction(17309980) == 0 and trade:hasItemQty(1424,1) and trade:hasItemQty(1425,1) and trade:getItemCount() == 2) then
		player:tradeComplete();
		SpawnMob(17309980,300):updateClaim(player); -- Spawn Genbu
		player:showText(npc,SKY_GOD_OFFSET + 5);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(SKY_GOD_OFFSET);
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