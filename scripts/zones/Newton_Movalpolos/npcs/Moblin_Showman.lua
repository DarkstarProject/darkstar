-----------------------------------
-- Area: Newton Movalpolos
-- NPC:  Moblin Showman - Bugbear Matman
-- @pos 124 20 -60 82
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Newton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(trade:hasItemQty(1878,1) and trade:getItemCount() == 1) then -- Air tank 
		player:tradeComplete();
		player:showText(npc, SHOWMAN_ACCEPT); -- Moblin Showman's dialogue
		SpawnMob(16826570,120):updateEnmity(player); -- Bugbear Matman
		npc:hideNPC(900);
	else
		player:showText(npc, SHOWMAN_DECLINE); -- Moblin Showman refuses your trade
	end


end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	 player:showText(npc, SHOWMAN_TRIGGER);
end;