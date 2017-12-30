-----------------------------------------
-- ID: 4497
-- Item: heart_chocolate
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic Regen While Healing 4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4497);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MPHEAL, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 4);
end;
