-----------------------------------------
-- ID: 5161
-- Item: serving_of_leadafry
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Agility 5
-- Vitality 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5161);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_VIT, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_VIT, 2);
end;
