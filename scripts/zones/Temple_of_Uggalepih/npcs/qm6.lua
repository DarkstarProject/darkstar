-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Sacrificial Goblet NM)
-- !pos 300 1 255 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onTrade(player,npc,trade)
    -- Trade Uggalepih Whistle
    if (trade:hasItemQty(1184,1) and trade:getItemCount() == 1 and not GetMobByID(SACRIFICIAL_GOBLET):isSpawned()) then
        player:tradeComplete();
        SpawnMob(SACRIFICIAL_GOBLET):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;
