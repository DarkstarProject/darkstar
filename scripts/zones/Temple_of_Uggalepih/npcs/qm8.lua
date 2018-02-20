-----------------------------------
-- Area: Temple of Uggalepih (159)
-- NPC:  qm8 (???)
-- Notes: Used to spawn Habetrot
-- !pos -57.434 -8.484 55.317 0
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade 12 La Theine Cabbages to pop Habetrot
    if (
        trade:hasItemQty(4366,12) and trade:getItemCount() == 12 and
        not GetMobByID(HABETROT):isSpawned() and
        not GetMobByID(HABETROT + 1):isSpawned()
    ) then
        player:tradeComplete();
        -- 20% Chance to spawn Habetrot, else it's a Rumble Crawler
        if (math.random(5) == 1) then
            SpawnMob(HABETROT):updateClaim(player); -- Spawn Habetrot
        else
            SpawnMob(HABETROT + 1):updateClaim(player); -- Spawn Rumble Crawler
        end
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(BITS_OF_VEGETABLE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
