-----------------------------------------
-- ID: 4499
-- Item: loaf_of_iron_bread
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 4
-- Vitality 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4499);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 4);
    target:addMod(MOD_VIT, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 4);
    target:delMod(MOD_VIT, 1);
end;
