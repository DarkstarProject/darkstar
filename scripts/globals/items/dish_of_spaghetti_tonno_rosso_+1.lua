-----------------------------------------
-- ID: 5624
-- Item: Dish of Spaghetti Tonno Rosso +1
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- Health % 13
-- Health Cap 185
-- Dexterity 2
-- Vitality 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,7200,5624);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 13);
    target:addMod(MOD_FOOD_HP_CAP, 185);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_VIT, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 13);
    target:delMod(MOD_FOOD_HP_CAP, 185);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_VIT, 3);
end;
