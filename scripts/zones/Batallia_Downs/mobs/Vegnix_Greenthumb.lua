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

function onMobDeath(mob,killer)
    if ( (killer:hasKeyItem(SEEDSPALL_ROSEUM) == false) and (killer:hasKeyItem(VIRIDIAN_KEY) == false) ) then
        killer:addKeyItem(SEEDSPALL_ROSEUM);
        killer:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_ROSEUM);
    end
end;