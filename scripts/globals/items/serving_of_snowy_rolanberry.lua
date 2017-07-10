-----------------------------------------
-- ID: 4594
-- Item: serving_of_snowy_rolanberry
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic % 19
-- Magic Cap 60
-- Intelligence 2
-- Wind Res 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4594);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 19);
    target:addMod(MOD_FOOD_MP_CAP, 60);
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_WINDRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 19);
    target:delMod(MOD_FOOD_MP_CAP, 60);
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_WINDRES, 5);
end;
