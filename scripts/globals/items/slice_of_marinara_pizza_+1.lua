-----------------------------------------
-- ID: 6212
-- Item: slice of marinara pizza +1
-- Food Effect: 60 minutes, all Races
-----------------------------------------
-- HP +25
-- Accuracy+11% (Max. 58)
-- Attack+21% (Max. 55)
-- "Undead Killer"+5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6212);
end;

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 58);
    target:addMod(MOD_FOOD_ATTP, 21);
    target:addMod(MOD_FOOD_ATT_CAP, 55);
    target:addMod(MOD_UNDEAD_KILLER, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_FOOD_ACCP, 111);
    target:delMod(MOD_FOOD_ACC_CAP, 58);
    target:delMod(MOD_FOOD_ATTP, 21);
    target:delMod(MOD_FOOD_ATT_CAP, 55);
    target:delMod(MOD_UNDEAD_KILLER, 5);
end;
