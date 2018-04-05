-----------------------------------------
-- ID: 6063
-- Item: fruit_parfait
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- MP+5% (Upper limit 50)
-- INT+3
-- MND+2
-- CHR+1
-- STR-3
-- MACC+3
-- MAB+6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,6063);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 5);
    target:addMod(MOD_FOOD_MP_CAP, 50);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_CHR, 1);
    target:addMod(MOD_STR, -3);
    target:addMod(MOD_MACC, 3);
    target:addMod(MOD_MATT, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 5);
    target:delMod(MOD_FOOD_MP_CAP, 50);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_CHR, 1);
    target:delMod(MOD_STR, -3);
    target:delMod(MOD_MACC, 3);
    target:delMod(MOD_MATT, 6);
end;
