-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Death From Above NM)
-- Involved In Mission: Death From Above
-- !pos 53 1 -32 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onTrade(player,npc,trade)
    -- Trade Bee Larvae
    if (trade:hasItemQty(1267,1) and trade:getItemCount() == 1 and not GetMobByID():isSpawned(DEATH_FROM_ABOVE)) then
        player:tradeComplete();
        SpawnMob(DEATH_FROM_ABOVE):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NM_OFFSET + 4);
end;
