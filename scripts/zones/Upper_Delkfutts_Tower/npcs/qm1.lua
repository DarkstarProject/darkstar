-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  ??? - Alkyoneus spawn
-- @pos -300 -175 22 158
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade moldy buckler
	if(GetMobAction(17424480) == 0 and trade:hasItemQty(2385,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17424480,120):updateEnmity(player); -- Alkyoneus
	end


end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;