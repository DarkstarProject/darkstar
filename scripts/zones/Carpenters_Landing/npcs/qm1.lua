-----------------------------------
--  Area: Carpenters' Landing
--  NPC:  ??? (qm1)
--  Note: Used to spawn Mycophile NM
--  @pos 145.500 -9.000 -699.000 2
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Sleepshroom, Woozyshroom, Danceshroom, 
	if (GetMobAction(16785722) == 0 and trade:hasItemQty(4373,1) and trade:hasItemQty(4374,1) and trade:hasItemQty(4375,1) and trade:getItemCount() == 3) then 
		player:tradeComplete();
		SpawnMob(16785722,300):updateClaim(player); -- Mycophile
	end

end; 


