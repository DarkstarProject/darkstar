-----------------------------------------
-- ID: 5399
-- A. Rem. Fireflies
-- Transports the user out of Arrapago Remnants
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------------

function onItemCheck(target)
    if target:getZoneID() == dsp.zone.ARRAPAGO_REMNANTS then
        return 0
    end
    return 56
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.A_REM,0,1)
end