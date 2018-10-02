-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Sozu Rogberry NM)
-- !pos  159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs");

function onTrade(player,npc,trade)
    -- Trade Flickering Lantern
    if (trade:hasItemQty(2387,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.SOZU_ROGBERRY):isSpawned()) then
        player:tradeComplete();
        SpawnMob(ID.mob.SOZU_ROGBERRY):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;
