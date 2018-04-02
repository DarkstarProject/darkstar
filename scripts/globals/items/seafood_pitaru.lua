-----------------------------------------
-- ID: 5891
-- Item: seafood_pitaru
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +8% (cap 120)
-- Increases rate of magic skill gains by 60%
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5891);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 8);
    target:addMod(MOD_FOOD_MP_CAP, 120);
    target:addMod(MOD_MAGIC_SKILLUP_RATE, 60);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 8);
    target:delMod(MOD_FOOD_MP_CAP, 120);
    target:delMod(MOD_MAGIC_SKILLUP_RATE, 60);
end;
