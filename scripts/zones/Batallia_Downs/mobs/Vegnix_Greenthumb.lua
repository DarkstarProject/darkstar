-----------------------------------
-- Area: Batallia Downs
--  MOB: Vegnix Greenthumb
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");

function onMobDeath(mob, player, isKiller)
    if (not player:hasKeyItem(dsp.kis.SEEDSPALL_ROSEUM) and not player:hasKeyItem(dsp.kis.VIRIDIAN_KEY)) then
        player:addKeyItem(dsp.kis.SEEDSPALL_ROSEUM);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.SEEDSPALL_ROSEUM);
    end
end;
