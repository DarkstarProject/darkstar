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
    if (not player:hasKeyItem(dsp.ki.SEEDSPALL_CAERULUM) and not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY)) then
        player:addKeyItem(dsp.ki.SEEDSPALL_CAERULUM);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.SEEDSPALL_CAERULUM);
    end
end;
