-----------------------------------------
-- ID: 4551
-- Item: salmon_croute
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP +3% (cap 130)
-- Dexterity 2
-- MND -2
-- Ranged Accuracy +6% (cap 15)
-- HP recovered while healing 2
-- MP recovered while healing 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4551);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 3);
    target:addMod(MOD_FOOD_MP_CAP, 130);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_RACCP, 6);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 3);
    target:delMod(MOD_FOOD_MP_CAP, 130);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_RACCP, 6);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
end;
