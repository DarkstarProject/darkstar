-----------------------------------------
-- ID: 11320
-- Skeleton Robe
-- Enchantment: 60Min, Costume - Skeleton
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if not target:canUseMisc(tpz.zoneMisc.COSTUME) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.COSTUME,564,0,3600)
end