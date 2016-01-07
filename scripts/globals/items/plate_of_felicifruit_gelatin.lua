-----------------------------------------
-- ID: 5978
-- Item: Plate of Felicifruit Gelatin
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- MP % 5 Cap 100
-- Intelligence +7
-- MP Healing +3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5978);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 5);
    target:addMod(MOD_FOOD_MP_CAP, 100);
    target:addMod(MOD_INT, 7);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 5);
    target:delMod(MOD_FOOD_MP_CAP, 100);
    target:delMod(MOD_INT, 7);
    target:delMod(MOD_MPHEAL, 3);
end;
