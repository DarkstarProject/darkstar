-----------------------------------------
-- ID: 6216
-- Item: slice of pepperoni_pizza_+1
-- Food Effect: 60 minutes, all Races
-----------------------------------------
-- HP +35
-- Strength 2
-- Accuracy 9% (caps @ 11)
-- Attack 10% (caps @ 16)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,6216);
end;

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 35);
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_FOOD_ACCP, 9);
    target:addMod(MOD_FOOD_ACC_CAP, 11);
    target:addMod(MOD_FOOD_ATTP, 10);
    target:addMod(MOD_FOOD_ATT_CAP, 16);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 35);
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_FOOD_ACCP, 9);
    target:delMod(MOD_FOOD_ACC_CAP, 11);
    target:delMod(MOD_FOOD_ATTP, 10);
    target:delMod(MOD_FOOD_ATT_CAP, 16);
end;
