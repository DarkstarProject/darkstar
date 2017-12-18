-----------------------------------------
-- ID: 4366
-- Item: la_theine_cabbage
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Agility 1
-- Vitality -3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4366);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, -3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, -3);
end;
