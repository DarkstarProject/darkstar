-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  ??? (Spawn Olla Pequena)
-- !pos 851 0.1 92 178
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");
require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1195,1) and trade:getItemCount() == 1) then -- Trade Ro'Maeve Water
        for i = OLLAS_OFFSET, OLLAS_OFFSET + 2 do
            if (GetMobByID(i):isSpawned()) then
                return;
            end
        end
        player:tradeComplete();
        SpawnMob(OLLAS_OFFSET):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(SMALL_HOLE_HERE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
