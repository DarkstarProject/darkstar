-----------------------------------------
-- ID: 6072
-- Item: Magma Steak +1
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- Strength +9
-- Attack +24% Cap 185
-- Ranged Attack +24% Cap 185
-- Vermin Killer +6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,6072);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 9);
    target:addMod(MOD_FOOD_ATTP, 24);
    target:addMod(MOD_FOOD_ATT_CAP, 185);
    target:addMod(MOD_FOOD_RATTP, 24);
    target:addMod(MOD_FOOD_RATT_CAP, 185);
    target:addMod(MOD_VERMIN_KILLER, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 9);
    target:delMod(MOD_FOOD_ATTP, 24);
    target:delMod(MOD_FOOD_ATT_CAP, 185);
    target:delMod(MOD_FOOD_RATTP, 24);
    target:delMod(MOD_FOOD_RATT_CAP, 185);
    target:delMod(MOD_VERMIN_KILLER, 6);
end;
