-----------------------------------------
-- ID: 5584
-- Item: plate_of_ic_pilav
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health % 14
-- Health Cap 65
-- Strength 4
-- Vitality -1
-- Intelligence -1
-- Health Regen While Healing 1
-- Attack % 22
-- Attack Cap 65
-- Ranged ATT % 22
-- Ranged ATT Cap 65
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5584);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 14);
    target:addMod(MOD_FOOD_HP_CAP, 65);
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 65);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 65);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 14);
    target:delMod(MOD_FOOD_HP_CAP, 65);
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 65);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 65);
end;
