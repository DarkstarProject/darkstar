-----------------------------------------
-- ID: 5739
-- Item: mug_of_honeyed_egg
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 8
-- Intelligence 1
-- MP recovered while healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5739);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 8);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 8);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_MPHEAL, 1);
end;
