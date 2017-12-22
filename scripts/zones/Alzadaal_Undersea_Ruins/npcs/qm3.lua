-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Armed Gears(ZNM T3))
-- !pos -42 -4 -169 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");
require("scripts/zones/Alzadaal_Undersea_Ruins/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2574,1) and trade:getItemCount() == 1) then -- Trade Ferrite
        if (not GetMobByID(ARMED_GEARS):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ARMED_GEARS):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
