-----------------------------------
-- Area: Batallia Downs
--  MOB: Vegnix Greenthumb
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Batallia_Downs/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(SEEDSPALL_ROSEUM) == false and player:hasKeyItem(VIRIDIAN_KEY) == false) then
        player:addKeyItem(SEEDSPALL_ROSEUM);
        player:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_ROSEUM);
    end
end;