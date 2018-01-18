-----------------------------------
-- Area: Batallia Downs
--  NPC: qm1 (???)
-- !pos -407.526 -23.507 412.544 105
-- Notes: Spawns Vegnix Greenthumb for ACP mission "Gatherer of Light (I)"
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/zones/Batallia_Downs/MobIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (not GetMobByID(VEGNIX_GREENTHUMB):isSpawned() and player:hasKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD) and not player:hasKeyItem(SEEDSPALL_ROSEUM) and not player:hasKeyItem(VIRIDIAN_KEY)) then
        SpawnMob(VEGNIX_GREENTHUMB):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;
