-----------------------------------------
-- ID: 6342
-- Item: bean_daifuku_+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP +30
-- VIT +4
-- Accuracy +11% (cap 54)
-- Ranged Accuracy +11% (cap 54)
-- Pet:
-- HP +30
-- VIT +4
-- Accuracy +11% (cap 81)
-- Ranged Accuracy +11% (cap 81)
-- Haste +4%
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6342)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30);
    target:addMod(dsp.mod.VIT, 4);
    target:addMod(dsp.mod.FOOD_ACCP, 11);
    target:addMod(dsp.mod.FOOD_ACC_CAP, 54);
    target:addMod(dsp.mod.FOOD_RACCP, 11);
    target:addMod(dsp.mod.FOOD_RACC_CAP, 54);
    target:addPetMod(dsp.mod.HP, 30);
    target:addPetMod(dsp.mod.VIT, 4);
    target:addPetMod(dsp.mod.FOOD_ACCP, 11);
    target:addPetMod(dsp.mod.FOOD_ACC_CAP, 81);
    target:addPetMod(dsp.mod.FOOD_RACCP, 11);
    target:addPetMod(dsp.mod.FOOD_RACC_CAP, 81);
    target:addPetMod(dsp.mod.HASTE_GEAR, 400);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30);
    target:delMod(dsp.mod.VIT, 4);
    target:delMod(dsp.mod.FOOD_ACCP, 11);
    target:delMod(dsp.mod.FOOD_ACC_CAP, 54);
    target:delMod(dsp.mod.FOOD_RACCP, 11);
    target:delMod(dsp.mod.FOOD_RACC_CAP, 54);
    target:delPetMod(dsp.mod.HP, 30);
    target:delPetMod(dsp.mod.VIT, 4);
    target:delPetMod(dsp.mod.FOOD_ACCP, 11);
    target:delPetMod(dsp.mod.FOOD_ACC_CAP, 81);
    target:delPetMod(dsp.mod.FOOD_RACCP, 11);
    target:delPetMod(dsp.mod.FOOD_RACC_CAP, 81);
    target:delPetMod(dsp.mod.HASTE_GEAR, 400);
end;