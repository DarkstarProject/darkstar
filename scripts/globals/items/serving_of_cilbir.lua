-----------------------------------------
-- ID: 5642
-- Item: serving_of_cilbir
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP % 5
-- MP % 5
-- HP recovered while healing 3
-- MP recovered while healing 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5642);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 5);
    target:addMod(MOD_FOOD_HP_CAP, 999);
    target:addMod(MOD_FOOD_MPP, 5);
    target:addMod(MOD_FOOD_MP_CAP, 999);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_HPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 5);
    target:delMod(MOD_FOOD_HP_CAP, 999);
    target:delMod(MOD_FOOD_MPP, 5);
    target:delMod(MOD_FOOD_MP_CAP, 999);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_HPHEAL, 3);
end;
