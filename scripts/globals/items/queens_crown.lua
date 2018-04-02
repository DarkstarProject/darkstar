-----------------------------------------
-- ID: 6064
-- Item: queens_crown
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- MP+6% (Upper limit 55)
-- INT+4
-- MND+3
-- CHR+2
-- STR-2
-- MACC+4
-- MAB+7
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,6064);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 6);
    target:addMod(MOD_FOOD_MP_CAP, 55);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MND, 3);
    target:addMod(MOD_CHR, 2);
    target:addMod(MOD_STR, -2);
    target:addMod(MOD_MACC, 4);
    target:addMod(MOD_MATT, 7);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 6);
    target:delMod(MOD_FOOD_MP_CAP, 55);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MND, 3);
    target:delMod(MOD_CHR, 2);
    target:delMod(MOD_STR, -2);
    target:delMod(MOD_MACC, 4);
    target:delMod(MOD_MATT, 7);
end;
