-----------------------------------------
-- ID: 5744
-- Item: marinara_pizza +1
-- Food Effect: 4 hours, all Races
-----------------------------------------
-- HP +25
-- Attack +21% (cap 55)
-- Accuracy +11% (cap 58)
-- Undead Killer
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5744);
end;

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_FOOD_ATTP, 21);
    target:addMod(MOD_FOOD_ATT_CAP, 55);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 58);
    target:addMod(MOD_UNDEAD_KILLER, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_FOOD_ATTP, 21);
    target:delMod(MOD_FOOD_ATT_CAP, 55);
    target:delMod(MOD_FOOD_ACCP, 11);
    target:delMod(MOD_FOOD_ACC_CAP, 58);
    target:delMod(MOD_UNDEAD_KILLER, 5);
end;
