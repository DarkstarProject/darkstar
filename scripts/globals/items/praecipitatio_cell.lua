-----------------------------------------
-- Praecipitatio Cell
-- ID 5378
-- Unlocks magic
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(dsp.effect.OMERTA) then
        return 0
    end
    return -1
end

function onItemUse(target)
    target:delStatusEffectSilent(dsp.effect.OMERTA)
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 10)
end