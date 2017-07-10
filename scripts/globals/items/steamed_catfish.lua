-----------------------------------------
-- ID: 4557
-- Item: steamed_catfish
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 30
-- Magic % 1 (cap 110)
-- Dex 3
-- Intelligence 1
-- Mind -3
-- Earth Res 10
-- Ranged Accuracy +6% (cap 15)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4557);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_FOOD_MPP, 1);
    target:addMod(MOD_FOOD_MP_CAP, 110);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_EARTHRES, 10);
    target:addMod(MOD_FOOD_RACCP, 6);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_FOOD_MPP, 1);
    target:delMod(MOD_FOOD_MP_CAP, 110);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_EARTHRES, 10);
    target:delMod(MOD_FOOD_RACCP, 6);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
end;
