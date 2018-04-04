-----------------------------------------
-- ID: 4569
-- Item: Bowl of Quadav Stew
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Agility -4
-- Vitality 2
-- Defense % 17
-- Defense Cap 60
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4569);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, -4);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_FOOD_DEFP, 17);
    target:addMod(MOD_FOOD_DEF_CAP, 60);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, -4);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_FOOD_DEFP, 17);
    target:delMod(MOD_FOOD_DEF_CAP, 60);
end;
