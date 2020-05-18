-----------------------------------------
-- ID: 5838
-- Item: Tube of Clear Salve II
-- Item Effect: Removes most status ailments from Pet
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if not target:hasPet() then
        result = dsp.msg.basic.REQUIRES_A_PET
    end
    return result
end

function onItemUse(target)
    local pet = target:getPet()
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
        if pet:hasStatusEffect(status) then
            pet:delStatusEffect(status)
            removedCount = removedCount + 1
        end
    end
    if pet:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) then
        pet:eraseStatusEffect(dsp.effectFlag.ERASABLE)
    else
        if removedCount == 0 then
            pet:messageBasic(dsp.msg.basic.NO_EFFECT)
        end
    end
end