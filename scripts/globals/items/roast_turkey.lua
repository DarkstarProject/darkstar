-----------------------------------------
-- ID: 5620
-- Item: roast_turkey
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 4
-- Vitality 4
-- hMP +2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5620);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_HPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_HPHEAL, 2);
end;
