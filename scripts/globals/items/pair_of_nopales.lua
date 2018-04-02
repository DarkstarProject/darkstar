-----------------------------------------
-- ID: 5650
-- Item: pair_of_nopales
-- Food Effect: 5min, All Races
-----------------------------------------
-- VIT -4
-- AGI +2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5650);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_VIT, -4);
    target:addMod(MOD_AGI, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, -4);
    target:delMod(MOD_AGI, 2);
end;
