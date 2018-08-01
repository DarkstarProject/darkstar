-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Ob(ZNM T1))
-- !pos 542 0 -129 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2592,1) and trade:getItemCount() == 1) then -- Trade Coq Lubricant
        if (not GetMobByID(ID.mob.OB):isSpawned()) then
            player:tradeComplete();
            SpawnMob(ID.mob.OB):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;
