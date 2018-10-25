-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Tinnin(ZNM T4))
-- !pos 278 0 -703 51
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2573,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.TINNIN):isSpawned()) then -- Trade Monkey wine
        player:tradeComplete();
        SpawnMob(ID.mob.TINNIN):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
