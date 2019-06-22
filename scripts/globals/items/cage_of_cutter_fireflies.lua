-----------------------------------------
-- ID: 5349
-- Cutter Fireflies
-- Transports the user to Arrapago Reef
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------------

function onItemCheck(target)
    if target:getZoneID() == dsp.zone.THE_ASHU_TALIF then
        return 0
    end
    return 56
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.CUTTER,0,1)
end