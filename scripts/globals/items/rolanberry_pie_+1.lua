-----------------------------------------
-- ID: 4339
-- Item: rolanberry_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 60
-- Intelligence 3
-- MP Regen While Healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4339);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 60);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 60);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MPHEAL, 1);
end;
