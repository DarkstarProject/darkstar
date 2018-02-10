----------------------------------
-- Area: Rolanberry Fields
--  MOB: Chuglix Berrypaws
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Rolanberry_Fields/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (not player:hasKeyItem(SEEDSPALL_CAERULUM) and not player:hasKeyItem(VIRIDIAN_KEY)) then
        player:addKeyItem(SEEDSPALL_CAERULUM);
        player:messageSpecial(KEYITEM_OBTAINED, SEEDSPALL_CAERULUM);
    end
end;
