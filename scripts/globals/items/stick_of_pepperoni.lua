-----------------------------------------
-- ID: 5660
-- Item: stick_of_pepperoni
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP % 3 (assuming 3% from testing, no known cap)
-- Strength 3
-- Intelligence -1
-- Attack % 60 (assuming 60%, cap 30)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5660);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 3);
    target:addMod(MOD_FOOD_HP_CAP, 999);
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 60);
    target:addMod(MOD_FOOD_ATT_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 3);
    target:delMod(MOD_FOOD_HP_CAP, 999);
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 60);
    target:delMod(MOD_FOOD_ATT_CAP, 30);
end;
