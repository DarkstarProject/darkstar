-----------------------------------------
-- Cirrocumulus Cell
-- ID 5370
-- Unlocks back and waist equipment
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local encumbrance = target:getStatusEffect(tpz.effect.ENCUMBRANCE_I)
    if (encumbrance) then
        local power = encumbrance:getPower()
        if bit.band(power, 0x8400) > 0 then
            return 0
        end
    end
    return -1
end

function onItemUse(target)
    local encumbrance = target:getStatusEffect(tpz.effect.ENCUMBRANCE_I)
    local power = encumbrance:getPower()
    local newpower = bit.band(power, bit.bnot(0x8400))
    target:delStatusEffectSilent(tpz.effect.ENCUMBRANCE_I)
    if (newpower > 0) then
        target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, newpower, 0, 0)
    end
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 5)
end