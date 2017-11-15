-----------------------------------------
-- ID: 4336
-- Item: sweet_baked_apple
-- Food Effect: 1hour, All Races
-----------------------------------------
-- Magic Points 25
-- Intelligence 4
-- MP Recovered While Healing 2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4336);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 25);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 25);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MPHEAL, 2);
end;
