-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  ???
-- !pos -302.000 -159.000 21.000 158
-----------------------------------
require("scripts/zones/Upper_Delkfutts_Tower/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade moldy buckler
    if (not GetMobByID(PALLAS):isSpawned() and trade:hasItemQty(2386,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(PALLAS):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
