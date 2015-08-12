-----------------------------------
-- Area: Crawlers' Nest
-- NPC:  ??? - Guardian Crawler (spawn 1)
-- @pos 124.335 -34.609 -75.373 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- Trade Rolanberry
	if (GetMobAction(17584130) == 0 and trade:hasItemQty(4365,1) and trade:getItemCount() == 1) then  
		player:tradeComplete();
		if (math.random(1,100)<=38) then
			SpawnMob(17584129,120):updateClaim(player); -- Guardian Crawler
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