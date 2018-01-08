-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Genbu's Spawn)
-- Allows players to spawn the HNM Genbu with a Gem of the North and a Winterstone.
-- !pos 257 -70 517 130
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade Gem of the North and Winterstone
    if (not GetMobByID(GENBU):isSpawned() and trade:hasItemQty(1424,1) and trade:hasItemQty(1425,1) and trade:getItemCount() == 2) then
        player:tradeComplete();
        SpawnMob(GENBU):updateClaim(player);
        player:showText(npc,SKY_GOD_OFFSET + 5);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(SKY_GOD_OFFSET);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
