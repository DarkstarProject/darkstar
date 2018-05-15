-----------------------------------
-- Area: Batallia Downs
--  MOB: Vegnix Greenthumb
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");

function onMobDeath(mob, player, isKiller)
    if (not player:hasKeyItem(dsp.ki.SEEDSPALL_ROSEUM) and not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY)) then
        player:addKeyItem(dsp.ki.SEEDSPALL_ROSEUM);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SEEDSPALL_ROSEUM);
    end
end;
