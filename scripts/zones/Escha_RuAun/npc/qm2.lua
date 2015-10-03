-----------------------------------
-- Area: Escha_RuAun
-- NPC:  ??? (Seiryu's Spawn)
-- Allows players to spawn the HNM Seiryu with a Gem of the East and a Springstone.
-- @pos 569 -70 -80 289
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Escha_RuAun/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Gem of the East and Springstone
	if (GetMobAction(17309981) == 0 and trade:hasItemQty(1418,1) and trade:hasItemQty(1419,1) and trade:getItemCount() == 2) then
		player:tradeComplete();
		SpawnMob(17309981,300):updateClaim(player); -- Spawn Seiryu
		player:showText(npc,SKY_GOD_OFFSET + 9);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(SKY_GOD_OFFSET + 1);
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