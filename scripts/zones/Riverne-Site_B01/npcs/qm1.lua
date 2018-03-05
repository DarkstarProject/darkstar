-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Unstable Displacement
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Riverne-Site_B01/TextIDs");
require("scripts/zones/Riverne-Site_B01/MobIDs");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1880,1) and trade:getItemCount() == 1 and not GetMobByID(UNSTABLE_CLUSTER):isSpawned()) then -- Trade Clustered tar
        player:tradeComplete();
        SpawnMob(UNSTABLE_CLUSTER):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(GROUND_GIVING_HEAT);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
