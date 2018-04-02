-----------------------------------------
-- ID: 5556
-- Item: cone_of_seraphs_kiss
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- HP 15
-- MP % 16 (cap 85)
-- MP Recovered While Healing 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5556);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 15);
    target:addMod(MOD_FOOD_MPP, 16);
    target:addMod(MOD_FOOD_MP_CAP, 85);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 15);
    target:delMod(MOD_FOOD_MPP, 16);
    target:delMod(MOD_FOOD_MP_CAP, 85);
    target:delMod(MOD_MPHEAL, 2);
end;
