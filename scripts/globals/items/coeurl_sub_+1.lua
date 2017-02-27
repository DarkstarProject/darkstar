-----------------------------------------
-- ID: 5167
-- Item: coeurl_sub_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 15
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Health Regen While Healing 1
-- Attack % 22
-- Attack Cap 80
-- Ranged ATT % 22
-- Ranged ATT Cap 80
-- Sleep Resist 1
-- Stun Resist 4
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5167);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 80);
    target:addMod(MOD_SLEEPRES, 1);
    target:addMod(MOD_STUNRES, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 80);
    target:delMod(MOD_SLEEPRES, 1);
    target:delMod(MOD_STUNRES, 4);
end;
