-----------------------------------------
-- ID: 4600
-- Item: lucky_egg
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 14
-- Magic 14
-- Evasion 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4600);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 14);
    target:addMod(MOD_MP, 14);
    target:addMod(MOD_EVA, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 14);
    target:delMod(MOD_MP, 14);
    target:delMod(MOD_EVA, 10);
end;
