-----------------------------------
-- Area: Rolanberry Fields
--   NM: Chuglix Berrypaws
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/keyitems")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if not player:hasKeyItem(dsp.ki.SEEDSPALL_CAERULUM) and not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY) then
        player:addKeyItem(dsp.ki.SEEDSPALL_CAERULUM)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SEEDSPALL_CAERULUM)
    end
end
