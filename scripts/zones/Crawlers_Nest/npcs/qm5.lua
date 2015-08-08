-----------------------------------
-- Area: Crawlers Nest
-- NPC:  ??? - Queen Crawler spawn
-- @pos -337.156 -3.607 -253.294 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- Trade Rolanberry 874
	if (GetMobAction(17584133) == 0 and trade:hasItemQty(4530,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		if (math.random(1,100)<=50) then
			SpawnMob(17584133,120):updateClaim(player); -- Queen Crawler
		else 
			player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN);				
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;