-----------------------------------
-- Area: Crawlers' Nest
-- NPC:  ??? - Awd Goggie spawn
-- @pos -253.026 -1.867 253.055 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Rolanberry 864
    if (GetMobAction(17584135) == 0 and trade:hasItemQty(4531,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        if (math.random(1,100)<=73) then
            SpawnMob(17584135,120):updateClaim(player); -- Awd Goggie
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