-----------------------------------------
-- ID: 4362
-- Item: lizard_egg
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 5
-- Magic 5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4362);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 5);
    target:addMod(MOD_MP, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 5);
    target:delMod(MOD_MP, 5);
end;
