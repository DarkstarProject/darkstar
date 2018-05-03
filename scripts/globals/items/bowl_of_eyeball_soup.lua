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
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4453);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_HPP, 6);
    target:addMod(dsp.mod.FOOD_HP_CAP, 70);
    target:addMod(dsp.mod.CHR, -10);
    target:addMod(dsp.mod.HPHEAL, 4);
    target:addMod(dsp.mod.ACC, 12);
    target:addMod(dsp.mod.RACC, 12);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 6);
    target:delMod(dsp.mod.FOOD_HP_CAP, 70);
    target:delMod(dsp.mod.CHR, -10);
    target:delMod(dsp.mod.HPHEAL, 4);
    target:delMod(dsp.mod.ACC, 12);
    target:delMod(dsp.mod.RACC, 12);
end;
