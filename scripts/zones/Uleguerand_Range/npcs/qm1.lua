-----------------------------------
--  Area: Uleguerand_Range
--   NPC: Geush Urvan
-----------------------------------
require("scripts/zones/Uleguerand_Range/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade Haunted Muleta
    if (not GetMobByID(GEUSH_URVAN):isSpawned() and trade:hasItemQty(1824,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(GEUSH_URVAN):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
