-----------------------------------------
-- ID: 5320
-- Item: Chunk of Smelling Salts
-- Item Effect: Recover Pets from Sleep
-- Duration: 180 Secs Medicated
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    pet = target:getPet()
    if (pet == nil) then
        return dsp.msg.basic.REQUIRES_A_PET
    elseif (pet:hasStatusEffect(dsp.effect.MEDICINE)) then
        return dsp.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    if (target:addStatusEffect(dsp.effect.MEDICINE,0,0,180,5320)) then
        target:messageBasic(GAINS_EFFECT_OF_STATUS, dsp.effect.MEDICINE)
        pet:delStatusEffect(dsp.effect.SLEEP_I)
        pet:delStatusEffect(dsp.effect.SLEEP_II)
        pet:delStatusEffect(dsp.effect.LULLABY)
    else
        target:messageBasic(dsp.msg.basic.NO_EFFECT)
    end
end

function onEffectGain(target,effect)
end

function onEffectLose(target,effect)
end