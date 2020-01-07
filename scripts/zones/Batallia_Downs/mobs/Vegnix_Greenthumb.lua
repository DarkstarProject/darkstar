-----------------------------------
-- Area: Batallia Downs
--  Mob: Vegnix Greenthumb
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs/IDs");
require("scripts/globals/keyitems");

function onMobDeath(mob, player, isKiller)
    if (not player:hasKeyItem(dsp.ki.SEEDSPALL_ROSEUM) and not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY)) then
        player:addKeyItem(dsp.ki.SEEDSPALL_ROSEUM);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SEEDSPALL_ROSEUM);
    end
end;
