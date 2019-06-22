-----------------------------------------
-- ID: 15919
-- Drover's Belt
-- Enchantment: 60Min, Costume - Chigoe (red)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if not target:canUseMisc(dsp.zoneMisc.COSTUME) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,1747,0,3600)
end