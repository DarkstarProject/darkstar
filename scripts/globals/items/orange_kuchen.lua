-----------------------------------------
-- ID: 4393
-- Item: orange_kuchen
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic % 13
-- Magic Cap 75
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4393);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 13);
    target:addMod(MOD_FOOD_MP_CAP, 75);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 13);
    target:delMod(MOD_FOOD_MP_CAP, 75);
end;
