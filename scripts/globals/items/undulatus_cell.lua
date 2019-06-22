-----------------------------------------
-- Undulatus Cell
-- ID 5371
-- Unlocks ranged and ammo equipment
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local encumbrance = target:getStatusEffect(dsp.effect.ENCUMBRANCE_I)
    if (encumbrance) then
        local power = encumbrance:getPower()
        if bit.band(power, 0x000C) > 0 then
            return 0
        end
    end
    return -1
end

function onItemUse(target)
    local encumbrance = target:getStatusEffect(dsp.effect.ENCUMBRANCE_I)
    local power = encumbrance:getPower()
    local newpower = bit.band(power, bit.bnot(0x000C))
    target:delStatusEffectSilent(dsp.effect.ENCUMBRANCE_I)
    if (newpower > 0) then
        target:addStatusEffectEx(dsp.effect.ENCUMBRANCE_I, dsp.effect.ENCUMBRANCE_I, newpower, 0, 0)
    end
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 6)
end