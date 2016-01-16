-----------------------------------------
-- ID: 4550
-- Item: plate_of_bream_risotto
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 40
-- Dexterity 6
-- Agility 3
-- Mind -4
-- Health Regen While Healing 1
-- Accuracy % 6
-- Accuracy Cap 15
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4550);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_MND, -4);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_FOOD_ACCP, 6);
    target:addMod(MOD_FOOD_ACC_CAP, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_MND, -4);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_FOOD_ACCP, 6);
    target:delMod(MOD_FOOD_ACC_CAP, 15);
end;
