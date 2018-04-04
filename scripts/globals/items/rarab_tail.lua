-----------------------------------------
-- ID: 4444
-- Item: rarab_tail
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 1
-- Vitality -3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4444);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, -3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, -3);
end;
