-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Velionis(ZNM T1))
-- !pos 311 -3 27 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2600,1) and trade:getItemCount() == 1) then -- Trade Golden Teeth
        if (not GetMobByID(ID.mob.VELIONIS):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ID.mob.VELIONIS):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;
