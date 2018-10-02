-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Unstable Displacement
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1880,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.UNSTABLE_CLUSTER):isSpawned()) then -- Trade Clustered tar
        player:tradeComplete();
        SpawnMob(ID.mob.UNSTABLE_CLUSTER):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.GROUND_GIVING_HEAT);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
