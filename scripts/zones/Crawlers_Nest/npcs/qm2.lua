-----------------------------------
-- Area: Crawlers' Nest
--  NPC: ??? - Guardian Crawler (Spawn 2)
-- !pos 44.436 -2.602 195.381 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Rolanberry
    if (GetMobAction(17584130) == 0 and trade:hasItemQty(4365,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        if (math.random(1,100)<=38) then
            SpawnMob(17584130):updateClaim(player); -- Guardian Crawler
            npc:setStatus(STATUS_DISAPPEAR) -- hide ???
        else
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN);
        end
    end
end;

function onTrigger(player,npc)
end;


