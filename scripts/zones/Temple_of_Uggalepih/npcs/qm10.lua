-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Sozu Rogberry NM)
-- !pos  159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onTrade(player,npc,trade)
    -- Trade Flickering Lantern
    if (trade:hasItemQty(2387,1) and trade:getItemCount() == 1 and not GetMobByID(SOZU_ROGBERRY):isSpawned()) then
        player:tradeComplete();
        SpawnMob(SOZU_ROGBERRY):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;
