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

function onMobDeath(mob,killer,ally)
    if (ally:hasKeyItem(SEEDSPALL_CAERULUM) == false and ally:hasKeyItem(VIRIDIAN_KEY) == false) then
        ally:addKeyItem(SEEDSPALL_CAERULUM);
        ally:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_CAERULUM);
    end
end;