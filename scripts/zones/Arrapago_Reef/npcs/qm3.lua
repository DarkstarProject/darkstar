-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Zareehkl the Jubilant(ZNM T2))
-- !pos 176 -4 182 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/zones/Arrapago_Reef/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2598,1) and trade:getItemCount() == 1) then -- Trade Merow No 11 Molting
        if (not GetMobByID(ZAREEHKL_THE_JUBILANT):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ZAREEHKL_THE_JUBILANT):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
