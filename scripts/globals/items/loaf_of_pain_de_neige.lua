-----------------------------------------
-- ID: 4292
-- Item: loaf_of_pain_de_neige
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 18
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4292);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 18);
    target:addMod(MOD_VIT, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 18);
    target:delMod(MOD_VIT, 4);
end;
