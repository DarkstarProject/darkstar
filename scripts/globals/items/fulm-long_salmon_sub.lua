-----------------------------------------
-- ID: 4266
-- Item: fulm-long_salmon_sub
-- Food Effect: 60Min, All Races
-----------------------------------------
-- DEX +2
-- VIT +1
-- AGI +1
-- INT +2
-- MND -2
-- Ranged Accuracy +3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4266);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_RACC, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_RACC, 3);
end;
