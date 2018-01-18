-----------------------------------------
-- ID: 5593
-- Item: cup_of_imperial_coffee_+1
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health Regen While Healing 5
-- Magic Regen While Healing 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5593);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_MPHEAL, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_MPHEAL, 5);
end;
