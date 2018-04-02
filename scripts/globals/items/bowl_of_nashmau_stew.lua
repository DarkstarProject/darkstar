-----------------------------------------
-- ID: 5595
-- Item: Bowl of Nashmau Stew
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP -100
-- Vitality -10
-- Agility -10
-- Intelligence -10
-- Mind -10
-- Charisma -10
-- Accuracy +15% Cap 25
-- Attack +18% Cap 60
-- Defense -100
-- Evasion -100
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5595);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, -100);
    target:addMod(MOD_VIT, -10);
    target:addMod(MOD_AGI, -10);
    target:addMod(MOD_INT, -10);
    target:addMod(MOD_MND, -10);
    target:addMod(MOD_CHR, -10);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 25);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_DEF, -100);
    target:addMod(MOD_EVA, -100);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, -100);
    target:delMod(MOD_VIT, -10);
    target:delMod(MOD_AGI, -10);
    target:delMod(MOD_INT, -10);
    target:delMod(MOD_MND, -10);
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 25);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_DEF, -100);
    target:delMod(MOD_EVA, -100);
end;
