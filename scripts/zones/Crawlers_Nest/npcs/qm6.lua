-----------------------------------
-- Area: Crawlers Nest
-- NPC:  ??? - Matron Crawler spawn
-- @pos -141.158 -33.689 20.944 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Rolanberry 874
    if (GetMobAction(17584134) == 0 and trade:hasItemQty(4530,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        if (math.random(1,100)<=34) then
            SpawnMob(17584134,120):updateClaim(player); -- Matron Crawler
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