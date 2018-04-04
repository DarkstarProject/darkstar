-----------------------------------------
-- ID: 4453
-- Item: Bowl of Eyeball Soup
-- Food Effect: 180Min, All Races
-----------------------------------------
-- HP +6% (cap 70)
-- Charisma -10
-- Health Regen While Healing 4
-- Accuracy 12
-- Ranged ACC 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4453);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 70);
    target:addMod(MOD_CHR, -10);
    target:addMod(MOD_HPHEAL, 4);
    target:addMod(MOD_ACC, 12);
    target:addMod(MOD_RACC, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 70);
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_HPHEAL, 4);
    target:delMod(MOD_ACC, 12);
    target:delMod(MOD_RACC, 12);
end;
