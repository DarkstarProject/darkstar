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
    if (player:hasKeyItem(dsp.kis.SEEDSPALL_VIRIDIS) == false and player:hasKeyItem(dsp.kis.VIRIDIAN_KEY) == false) then
        player:addKeyItem(dsp.kis.SEEDSPALL_VIRIDIS);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.SEEDSPALL_VIRIDIS);
    end
end;