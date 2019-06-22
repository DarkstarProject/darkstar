-----------------------------------------
-- ID: 6341
-- Item: bean_daifuku
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +20
-- VIT +3
-- Accuracy +10% (cap 50)
-- Ranged Accuracy +10% (cap 50)
-- Pet:
-- HP +20
-- VIT +3
-- Accuracy +10% (cap 75)
-- Ranged Accuracy +10% (cap 75)
-- Haste +3%
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6341)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20);
    target:addMod(dsp.mod.VIT, 3);
    target:addMod(dsp.mod.FOOD_ACCP, 10);
    target:addMod(dsp.mod.FOOD_ACC_CAP, 50);
    target:addMod(dsp.mod.FOOD_RACCP, 10);
    target:addMod(dsp.mod.FOOD_RACC_CAP, 50);
    target:addPetMod(dsp.mod.HP, 20);
    target:addPetMod(dsp.mod.VIT, 3);
    target:addPetMod(dsp.mod.FOOD_ACCP, 10);
    target:addPetMod(dsp.mod.FOOD_ACC_CAP, 75);
    target:addPetMod(dsp.mod.FOOD_RACCP, 10);
    target:addPetMod(dsp.mod.FOOD_RACC_CAP, 75);
    target:addPetMod(dsp.mod.HASTE_GEAR, 300);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20);
    target:delMod(dsp.mod.VIT, 3);
    target:delMod(dsp.mod.FOOD_ACCP, 10);
    target:delMod(dsp.mod.FOOD_ACC_CAP, 50);
    target:delMod(dsp.mod.FOOD_RACCP, 10);
    target:delMod(dsp.mod.FOOD_RACC_CAP, 50);
    target:delPetMod(dsp.mod.HP, 20);
    target:delPetMod(dsp.mod.VIT, 3);
    target:delPetMod(dsp.mod.FOOD_ACCP, 10);
    target:delPetMod(dsp.mod.FOOD_ACC_CAP, 75);
    target:delPetMod(dsp.mod.FOOD_RACCP, 10);
    target:delPetMod(dsp.mod.FOOD_RACC_CAP, 75);
    target:delPetMod(dsp.mod.HASTE_GEAR, 300);
end;