-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Nuhn(ZNM T3))
-- !pos -451 -7 389 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/zones/Arrapago_Reef/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2596,1) and trade:getItemCount() == 1) then -- Trade Rose Scampi
        if (not GetMobByID(NUHN):isSpawned()) then
            player:tradeComplete();
            SpawnMob(NUHN):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
