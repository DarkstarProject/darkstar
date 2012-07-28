-----------------------------------
-- Area: Den of Rancor
-- NPC:  ??? - HakuTaku spawn
-- @pos X:24 Y:25 Z:-306 (206)
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	-- Trade Hakutaku Eye Cluster 
	if(trade:hasItemQty(1298,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17433009,120):updateEnmity(player); -- Hakutaku
	end


end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;