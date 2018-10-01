-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Nuhn(ZNM T3))
-- !pos -451 -7 389 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2596,1) and trade:getItemCount() == 1) then -- Trade Rose Scampi
        if (not GetMobByID(ID.mob.NUHN):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ID.mob.NUHN):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;
