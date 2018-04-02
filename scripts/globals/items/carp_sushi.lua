-----------------------------------------
-- ID: 4407
-- Item: carp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 1
-- Accuracy % 10 (cap 52)
-- HP Recovered While Healing 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4407);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_FOOD_ACCP, 10);
    target:addMod(MOD_FOOD_ACC_CAP, 52);
    target:addMod(MOD_HPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_FOOD_ACCP, 10);
    target:delMod(MOD_FOOD_ACC_CAP, 52);
    target:delMod(MOD_HPHEAL, 2);
end;
