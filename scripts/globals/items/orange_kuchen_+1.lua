-----------------------------------------
-- ID: 4332
-- Item: orange_kuchen_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- MP % 13 (cap 80)
-- MP Recovered While Healing 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4332);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 13);
    target:addMod(MOD_FOOD_MP_CAP, 80);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 13);
    target:delMod(MOD_FOOD_MP_CAP, 80);
    target:delMod(MOD_MPHEAL, 1);
end;
