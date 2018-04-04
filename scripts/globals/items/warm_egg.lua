-----------------------------------------
-- ID: 4602
-- Item: warm_egg
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 18
-- Magic 18
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4602);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 18);
    target:addMod(MOD_MP, 18);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 18);
    target:delMod(MOD_MP, 18);
end;
