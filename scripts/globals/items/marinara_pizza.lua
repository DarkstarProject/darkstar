-----------------------------------------
-- ID: 5743
-- Item: marinara_pizza
-- Food Effect: 3 hours, all Races
-----------------------------------------
-- HP +20
-- Attack +20% (cap 50 @ 250 base attack)
-- Accuracy +10% (54)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5743);
end;

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 50);
    target:addMod(MOD_FOOD_ACCP, 10);
    target:addMod(MOD_FOOD_ACC_CAP, 54);
    target:addMod(MOD_UNDEAD_KILLER, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 50);
    target:delMod(MOD_FOOD_ACCP, 10);
    target:delMod(MOD_FOOD_ACC_CAP, 54);
    target:delMod(MOD_UNDEAD_KILLER, 5);
end;
