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

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(SEEDSPALL_CAERULUM) == false and player:hasKeyItem(VIRIDIAN_KEY) == false) then
        player:addKeyItem(SEEDSPALL_CAERULUM);
        player:messageSpecial(KEYITEM_OBTAINED,SEEDSPALL_CAERULUM);
    end
end;