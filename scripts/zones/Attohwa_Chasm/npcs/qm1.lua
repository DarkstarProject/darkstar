-----------------------------------
-- Area: Attohwa Chasm
--  NPC: ??? (qm1)
-- !pos -402.574 3.999 -202.750 7
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Attohwa_Chasm/TextIDs");
require("scripts/zones/Attohwa_Chasm/MobIDs");

function onTrade(player,npc,trade)
    local nm = GetMobByID(FEELER_ANTLION);
    if (not nm:isSpawned() and trade:hasItemQty(1825,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        nm:setSpawn(npc:getXPos() - 3, npc:getYPos() - 2, npc:getZPos() - 1);
        SpawnMob(FEELER_ANTLION):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(OCCASIONAL_LUMPS);
end;
