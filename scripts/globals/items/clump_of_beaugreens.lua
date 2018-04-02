-----------------------------------------
-- ID: 4571
-- Item: clump_of_beaugreens
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 2
-- Vitality -4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4571);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_VIT, -4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_VIT, -4);
end;
