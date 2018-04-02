-----------------------------------------
-- ID: 4567
-- Item: moon_carrot
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 1
-- Vitality -1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4567);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, -1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, -1);
end;
