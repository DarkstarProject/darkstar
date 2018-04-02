-----------------------------------------
-- ID: 5320
-- Item: Chunk of Smelling Salts
-- Item Effect: Recover Pets from Sleep
-- Duration: 180 Secs Medicated
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    pet = target:getPet();
    if (pet == nil) then
        return msgBasic.REQUIRES_A_PET;
    elseif (pet:hasStatusEffect(EFFECT.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    if (target:addStatusEffect(EFFECT.MEDICINE,0,0,180,5320)) then
        target:messageBasic(GAINS_EFFECT_OF_STATUS, EFFECT.MEDICINE);
        pet:delStatusEffect(EFFECT.SLEEP_I);
        pet:delStatusEffect(EFFECT.SLEEP_II);
        pet:delStatusEffect(EFFECT.LULLABY);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;

function onEffectGain(target,effect)
end;

function onEffectLose(target,effect)
end;