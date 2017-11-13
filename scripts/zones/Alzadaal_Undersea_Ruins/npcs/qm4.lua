-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Wulgaru(ZNM T2))
-- !pos -22 -4 204 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");
require("scripts/zones/Alzadaal_Undersea_Ruins/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2597,1) and trade:getItemCount() == 1) then -- Trade Opalus Gem
        if (not GetMobByID(WULGARU):isSpawned()) then
            player:tradeComplete();
            SpawnMob(WULGARU):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
