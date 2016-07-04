-----------------------------------------
-- ID: 5623
-- Item: Dish of Spaghetti Tonno Rosso
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- Health % 13
-- Health Cap 180
-- Dexterity 1
-- Vitality 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5623);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 13);
    target:addMod(MOD_FOOD_HP_CAP, 180);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 13);
    target:delMod(MOD_FOOD_HP_CAP, 180);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT, 2);
end;
