-----------------------------------------
-- ID: 5717
-- Item: M&P Doner Kabob
-- Food Effect: 5Min, All Races
-----------------------------------------
-- HP 5% (cap 150)
-- MP 5% (cap 150)
-- hHP +2
-- hMP +2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5717);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 5);
    target:addMod(MOD_FOOD_HP_CAP, 150);
    target:addMod(MOD_FOOD_MPP, 5);
    target:addMod(MOD_FOOD_MP_CAP, 150);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 5);
    target:delMod(MOD_FOOD_HP_CAP, 150);
    target:delMod(MOD_FOOD_MPP, 5);
    target:delMod(MOD_FOOD_MP_CAP, 150);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
end;
