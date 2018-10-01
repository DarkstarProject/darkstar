-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Gotoh Zha the Redolent(ZNM T3))
-- !pos -337 -31 676 51
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2575,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.GOTOH_ZHA_THE_REDOLENT):isSpawned()) then -- Trade Sheep Botfly
        player:tradeComplete();
        SpawnMob(ID.mob.GOTOH_ZHA_THE_REDOLENT):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
