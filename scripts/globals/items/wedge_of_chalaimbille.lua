-----------------------------------------
-- ID: 5684
-- Item: wedge_of_chalaimbille
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 6 (cap 40)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5684);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 40);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 40);
end;
