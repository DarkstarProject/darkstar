-----------------------------------------
-- ID: 4380
-- Item: smoked_salmon
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 2
-- Mind -3
-- Ranged Accuracy +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4380);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_RACC, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_RACC, 1);
end;
