-----------------------------------------
-- ID: 6395
-- Item: pork_cutlet_+1
-- Food Effect: 240Min, All Races
-----------------------------------------
-- HP +45
-- STR +8
-- INT -8
-- Fire resistance +21
-- Attack +21% (cap 125)
-- Ranged Attack +21% (cap 125)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,6395);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_STR, 8);
    target:addMod(MOD_INT, -8);
    target:addMod(MOD_FIRERES, 21);
    target:addMod(MOD_FOOD_ATTP, 21);
    target:addMod(MOD_FOOD_ATT_CAP, 125);
    target:addMod(MOD_FOOD_RATTP, 21);
    target:addMod(MOD_FOOD_RATT_CAP, 125);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_STR, 8);
    target:delMod(MOD_INT, -8);
    target:delMod(MOD_FIRERES, 21);
    target:delMod(MOD_FOOD_ATTP, 21);
    target:delMod(MOD_FOOD_ATT_CAP, 125);
    target:delMod(MOD_FOOD_RATTP, 21);
    target:delMod(MOD_FOOD_RATT_CAP, 125);
end;
