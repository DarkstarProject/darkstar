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

function onMobDeath(mob,killer,ally)
    if (ally:hasKeyItem(SEEDSPALL_ROSEUM) == false and ally:hasKeyItem(VIRIDIAN_KEY) == false) then
        ally:addKeyItem(SEEDSPALL_ROSEUM);
        ally:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_ROSEUM);
    end
end;