-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Lil'Apkallu(ZNM T1))
-- !pos 488 -1 166 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/zones/Arrapago_Reef/MobIDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2601,1) and trade:getItemCount() == 1) then -- Trade Greenling
        if (not GetMobByID(LIL_APKALLU):isSpawned()) then
            player:tradeComplete();
            SpawnMob(LIL_APKALLU):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;
