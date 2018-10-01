-----------------------------------
--  Area: Uleguerand_Range
--   NPC: Geush Urvan
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade Haunted Muleta
    if (not GetMobByID(ID.mob.GEUSH_URVAN):isSpawned() and trade:hasItemQty(1824,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(ID.mob.GEUSH_URVAN):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
