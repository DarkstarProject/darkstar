-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Dribblix Greasemaw
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Sauromugue_Champaign/TextIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(dsp.ki.SEEDSPALL_VIRIDIS) == false and player:hasKeyItem(dsp.ki.VIRIDIAN_KEY) == false) then
        player:addKeyItem(dsp.ki.SEEDSPALL_VIRIDIS);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SEEDSPALL_VIRIDIS);
    end
end;