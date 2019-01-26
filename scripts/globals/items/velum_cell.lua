-----------------------------------------
-- Velum Cell
-- ID 5380
-- Removes INT Down effect
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local debilitation = target:getStatusEffect(dsp.effect.DEBILITATION)
    if (debilitation) then
        local power = debilitation:getPower()
        if bit.band(power, 0x010) > 0 then
            return 0
        end
    end
    return -1
end

function onItemUse(target)
    local debilitation = target:getStatusEffect(dsp.effect.DEBILITATION)
    local power = debilitation:getPower()
    local newpower = bit.band(power, bit.bnot(0x010))
    target:delStatusEffectSilent(dsp.effect.DEBILITATION)
    if (newpower > 0) then
        target:addStatusEffectEx(dsp.effect.DEBILITATION, dsp.effect.DEBILITATION, newpower, 0, 0)
    end
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 15)
end