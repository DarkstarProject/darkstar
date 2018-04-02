-----------------------------------------
-- ID: 4327
-- Item: Bowl of Emerald Soup
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Agility 2
-- Vitality -1
-- Health Regen While Healing 3
-- Ranged ACC 6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4327);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_RACC, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_RACC, 6);
end;
