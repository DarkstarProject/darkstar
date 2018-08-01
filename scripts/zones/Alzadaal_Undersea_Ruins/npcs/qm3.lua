-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Armed Gears(ZNM T3))
-- !pos -42 -4 -169 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2574,1) and trade:getItemCount() == 1) then -- Trade Ferrite
        if (not GetMobByID(ID.mob.ARMED_GEARS):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ID.mob.ARMED_GEARS):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;
