-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  ??? (Spawn Ullikummi)
-- !pos 739 -99 -581 178
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    if (not GetMobByID(ULLIKUMMI):isSpawned() and trade:hasItemQty(2388,1) and trade:getItemCount() == 1) then -- Trade Diorite
        player:tradeComplete();
        SpawnMob(ULLIKUMMI):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
