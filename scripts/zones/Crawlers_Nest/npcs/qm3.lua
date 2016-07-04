-----------------------------------
-- Area: Crawlers' Nest
-- NPC:  ??? - Drown Crawler (Spawn area 1)
-- @pos 4.045 -2.703 285.026 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Rolanberry 881
    if (GetMobAction(17584132) == 0 and trade:hasItemQty(4529,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        if (math.random(1,100)<=50) then
            SpawnMob(17584131,120):updateClaim(player); -- Drone Crawler
            npc:setStatus(STATUS_DISAPPEAR) -- hide ???
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