-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  ??? (Spawn Kirin)
-- !pos -81 32 2 178
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    if (not GetMobByID(KIRIN):isSpawned() and trade:hasItemQty(1404, 1) and trade:hasItemQty(1405, 1) and trade:hasItemQty(1406, 1) and trade:hasItemQty(1407, 1) and trade:getItemCount() == 4) then
        player:tradeComplete();
        player:showText(npc, KIRIN_OFFSET);
        SpawnMob(KIRIN):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:startEvent(100);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
