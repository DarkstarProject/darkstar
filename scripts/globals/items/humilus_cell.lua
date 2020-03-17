-----------------------------------------
-- Humilus Cell
-- ID 5383
-- Removes HP Down effect
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------------

function onItemCheck(target)
    return salvageUtil.onCellItemCheck(target, tpz.effect.DEBILITATION, 0x080)
end

function onItemUse(target)
    return salvageUtil.onCellItemUse(target, tpz.effect.DEBILITATION, 0x080, 18)
end