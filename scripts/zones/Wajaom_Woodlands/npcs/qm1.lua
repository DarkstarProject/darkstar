-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Vulpangue(ZNM T1))
-- !pos -697 -7 -123 51
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2580,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.VULPANGUE):isSpawned()) then -- Trade Hellcage Butterfly
        player:tradeComplete();
        SpawnMob(ID.mob.VULPANGUE):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
