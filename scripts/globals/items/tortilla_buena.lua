-----------------------------------------
-- ID: 5181
-- Item: tortilla_buena
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 8
-- Vitality 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5181);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 8);
    target:addMod(MOD_VIT, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 8);
    target:delMod(MOD_VIT, 4);
end;
