-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Ob(ZNM T1))
-- !pos 542 0 -129 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/TextIDs");
require("scripts/zones/Alzadaal_Undersea_Ruins/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2592,1) and trade:getItemCount() == 1) then -- Trade Coq Lubricant
        if (not GetMobByID(OB):isSpawned()) then
            player:tradeComplete();
            SpawnMob(OB):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
