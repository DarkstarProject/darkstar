-----------------------------------------
-- ID: 6459
-- Item: bowl_of_soy_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +55
-- STR +6
-- VIT +6
-- AGI +4
-- Attack +11% (cap 175)
-- Ranged Attack +11% (cap 175)
-- Resist Slow +15
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,6459);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 55);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_VIT, 6);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_FOOD_ATTP, 11);
    target:addMod(MOD_FOOD_ATT_CAP, 175);
    target:addMod(MOD_FOOD_RATTP, 11);
    target:addMod(MOD_FOOD_RATT_CAP, 175);
    target:addMod(MOD_SLOWRES, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 55);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_FOOD_ATTP, 11);
    target:delMod(MOD_FOOD_ATT_CAP, 175);
    target:delMod(MOD_FOOD_RATTP, 11);
    target:delMod(MOD_FOOD_RATT_CAP, 175);
    target:delMod(MOD_SLOWRES, 15);
end;
