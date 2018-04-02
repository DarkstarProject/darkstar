-----------------------------------------
-- ID: 5173
-- Item: timbre_timbers_taco
-- Food Effect: 1hour, All Races
-----------------------------------------
-- MP 20
-- Vitality -1
-- Agility 5
-- MP Recovered While Healing 3
-- Ranged Accuracy % 8 (cap 15)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5173);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_FOOD_RACCP, 8);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_FOOD_RACCP, 8);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
end;
