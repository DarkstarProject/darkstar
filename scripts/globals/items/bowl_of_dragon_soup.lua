-----------------------------------------
-- ID: 4549
-- Item: Bowl of Dragon Soup
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 20
-- Strength 7
-- Agility 2
-- Vitality 2
-- Intelligence -3
-- Health Regen While Healing 8
-- Attack % 22
-- Attack Cap 150
-- Ranged ATT % 22
-- Ranged ATT Cap 150
-- Demon Killer 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4549);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_HPHEAL, 8);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 150);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 150);
    target:addMod(MOD_DEMON_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_HPHEAL, 8);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 150);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 150);
    target:delMod(MOD_DEMON_KILLER, 5);
end;
