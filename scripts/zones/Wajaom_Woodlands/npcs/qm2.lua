-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Iriz Ima(ZNM T2))
-- !pos 253 -23 116 51
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2577,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.IRIZ_IMA):isSpawned()) then -- Trade Senorita Pamamas
        player:tradeComplete();
        SpawnMob(ID.mob.IRIZ_IMA):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
