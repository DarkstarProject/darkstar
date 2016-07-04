-----------------------------------------
-- ID: 4518
-- Item: strip_of_sheep_jerky
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 22
-- Attack Cap 35
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4518);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 35);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 35);
end;
