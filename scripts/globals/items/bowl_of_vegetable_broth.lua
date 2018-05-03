-----------------------------------------
-- ID: 4323
-- Item: bowl_of_vegetable_broth
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Vitality -1
-- Agility 5
-- Ranged Accuracy 6
-- HP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4323);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.VIT, -1);
    target:addMod(dsp.mod.AGI, 5);
    target:addMod(dsp.mod.RACC, 6);
    target:addMod(dsp.mod.HPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, -1);
    target:delMod(dsp.mod.AGI, 5);
    target:delMod(dsp.mod.RACC, 6);
    target:delMod(dsp.mod.HPHEAL, 3);
end;
