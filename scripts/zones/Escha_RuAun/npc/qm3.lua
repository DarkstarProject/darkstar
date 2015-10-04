-----------------------------------
-- Area: Escha_RuAun
-- NPC:  ??? (Byakko's Spawn)
-- Allows players to spawn the HNM Byakko with a Gem of the West and an Autumnstone.
-- @pos -410 -70 394 289
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Escha_RuAun/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Gem of the West and Autumnstone
	if (GetMobAction(17309982) == 0 and trade:hasItemQty(1422,1) and trade:hasItemQty(1423,1) and trade:getItemCount() == 2) then
		player:tradeComplete();
		SpawnMob(17309982,300):updateClaim(player); -- Spawn Byakko
		player:showText(npc,SKY_GOD_OFFSET + 11);
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(SKY_GOD_OFFSET + 2);
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