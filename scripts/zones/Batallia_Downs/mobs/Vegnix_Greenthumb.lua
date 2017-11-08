-----------------------------------
-- Area: Batallia Downs
--  MOB: Vegnix Greenthumb
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");

function onMobDeath(mob, player, isKiller)
    if (not player:hasKeyItem(SEEDSPALL_ROSEUM) and not player:hasKeyItem(VIRIDIAN_KEY)) then
        player:addKeyItem(SEEDSPALL_ROSEUM);
        player:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_ROSEUM);
    end
end;
