-----------------------------------------
-- ID: 5658
-- Item: Dish of Spafhetti Ortolana
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- Agility 2
-- Vitality 2
-- HP +30% Cap 70
-- StoreTP +6
-- Resist Blind +10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5658);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_FOOD_HPP, 30);
    target:addMod(MOD_FOOD_HP_CAP, 70);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_BLINDRES, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_FOOD_HPP, 30);
    target:delMod(MOD_FOOD_HP_CAP, 70);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_BLINDRES, 10);
end;
