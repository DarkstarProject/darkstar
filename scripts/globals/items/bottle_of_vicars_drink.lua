-----------------------------------------
-- ID: 5439
-- Item: Bottle of Vicar's Drink
-- Item Effect: Removes most status ailments AoE
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local removedCount = 0
    local removable =
    {
        dsp.effect.PETRIFICATION,
        dsp.effect.SILENCE,
        dsp.effect.BIND,
        dsp.effect.BANE,
        dsp.effect.CURSE_II,
        dsp.effect.CURSE,
        dsp.effect.PARALYSIS,
        dsp.effect.PLAGUE,
        dsp.effect.POISON,
        dsp.effect.DISEASE,
        dsp.effect.BLINDNESS
    }
    for _, status in pairs(removable) do
        if target:hasStatusEffect(status) then
            target:delStatusEffect(status)
            removedCount = removedCount + 1
        end
    end
    if target:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) then
        target:eraseStatusEffect(dsp.effectFlag.ERASABLE)
    else
        if removedCount == 0 then
            target:messageBasic(dsp.msg.basic.NO_EFFECT)
        end
    end
end