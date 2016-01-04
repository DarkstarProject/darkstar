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
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5595);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, -100);
    target:addMod(MOD_VIT, -10);
    target:addMod(MOD_AGI, -10);
    target:addMod(MOD_INT, -10);
    target:addMod(MOD_MND, -10);
    target:addMod(MOD_CHR, -10);
    target:addMod(MOD_FOOD_ACCP, 18);
    target:addMod(MOD_FOOD_ACC_CAP, 25);
    target:addMod(MOD_FOOD_ATTP, 15);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_DEF, -100);
    target:addMod(MOD_EVA, -100);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, -100);
    target:delMod(MOD_VIT, -10);
    target:delMod(MOD_AGI, -10);
    target:delMod(MOD_INT, -10);
    target:delMod(MOD_MND, -10);
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_FOOD_ACCP, 18);
    target:delMod(MOD_FOOD_ACC_CAP, 25);
    target:delMod(MOD_FOOD_ATTP, 15);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_DEF, -100);
    target:delMod(MOD_EVA, -100);
end;
