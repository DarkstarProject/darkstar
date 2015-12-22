-----------------------------------------
-- ID: 5710
-- Item: Berry Snowcone
-- Food Effect: 5 Min, All Races
-----------------------------------------
-- MP % 30 Cap 30
-- Intelligence 1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD)) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5710);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 30);
    target:addMod(MOD_FOOD_MP_CAP, 30);
    target:addMod(MOD_INT, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 30);
    target:delMod(MOD_FOOD_MP_CAP, 30);
    target:delMod(MOD_INT, 1);
end;
