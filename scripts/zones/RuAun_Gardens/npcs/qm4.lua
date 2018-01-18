-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Suzaku's Spawn)
-- Allows players to spawn the HNM Suzaku with a Gem of the South and a Summerstone.
-- !pos -514 -70 -264 130
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade Gem of the South and Summerstone
    if (not GetMobByID(SUZAKU):isSpawned() and trade:hasItemQty(1420,1) and trade:hasItemQty(1421,1) and trade:getItemCount() == 2) then
        player:tradeComplete();
        SpawnMob(SUZAKU):updateClaim(player);
        player:showText(npc,SKY_GOD_OFFSET + 7);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(SKY_GOD_OFFSET + 3);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
