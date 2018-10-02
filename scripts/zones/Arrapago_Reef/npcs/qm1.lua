-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Lil'Apkallu(ZNM T1))
-- !pos 488 -1 166 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2601,1) and trade:getItemCount() == 1) then -- Trade Greenling
        if (not GetMobByID(ID.mob.LIL_APKALLU):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ID.mob.LIL_APKALLU):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;
