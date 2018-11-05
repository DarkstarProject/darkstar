-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Dribblix Greasemaw
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Sauromugue_Champaign/IDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(dsp.ki.SEEDSPALL_VIRIDIS) == false and player:hasKeyItem(dsp.ki.VIRIDIAN_KEY) == false) then
        player:addKeyItem(dsp.ki.SEEDSPALL_VIRIDIS);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SEEDSPALL_VIRIDIS);
    end
end;