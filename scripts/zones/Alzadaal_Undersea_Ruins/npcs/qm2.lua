-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Cheese Hoarder Gigiroon(ZNM T1))
-- !pos -184 -8 24 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2582,1) and trade:getItemCount() == 1) then -- Trade Rodent Cheese
        if (not GetMobByID(ID.mob.CHEESE_HOARDER_GIGIROON):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ID.mob.CHEESE_HOARDER_GIGIROON):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;
