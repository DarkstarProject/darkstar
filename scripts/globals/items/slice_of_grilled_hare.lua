-----------------------------------------
-- ID: 4371
-- Item: slice_of_grilled_hare
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 2
-- Intelligence -1
-- Attack % 30
-- Attack Cap 15
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4371);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 30);
    target:addMod(MOD_FOOD_ATT_CAP, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 30);
    target:delMod(MOD_FOOD_ATT_CAP, 15);
end;
