----------------------------------
-- Area: Rolanberry Fields
-- MOB:  Chuglix Berrypaws
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Rolanberry_Fields/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if ( (killer:hasKeyItem(SEEDSPALL_CAERULUM) == false) and (player:hasKeyItem(VIRIDIAN_KEY) == false) ) then
        killer:addKeyItem(SEEDSPALL_CAERULUM);
        killer:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_CAERULUM);
    end
end;