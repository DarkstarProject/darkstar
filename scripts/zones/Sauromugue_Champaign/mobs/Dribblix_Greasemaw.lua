-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Dribblix Greasemaw
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if not player:hasKeyItem(dsp.ki.SEEDSPALL_VIRIDIS) and not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY) then
        player:addKeyItem(dsp.ki.SEEDSPALL_VIRIDIS)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SEEDSPALL_VIRIDIS)
    end
end