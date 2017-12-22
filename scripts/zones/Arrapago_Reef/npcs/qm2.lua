-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Velionis(ZNM T1))
-- !pos 311 -3 27 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/zones/Arrapago_Reef/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2600,1) and trade:getItemCount() == 1) then -- Trade Golden Teeth
        if (not GetMobByID(VELIONIS):isSpawned()) then
            player:tradeComplete();
            SpawnMob(VELIONIS):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
