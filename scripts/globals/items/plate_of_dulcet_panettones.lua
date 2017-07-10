-----------------------------------------
-- ID: 5979
-- Item: Plate of Dulcet Panettones
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- MP % 6 Cap 105
-- Intelligence +8
-- MP Healing +4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5979);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 6);
    target:addMod(MOD_FOOD_MP_CAP, 105);
    target:addMod(MOD_INT, 8);
    target:addMod(MOD_MPHEAL, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 6);
    target:delMod(MOD_FOOD_MP_CAP, 105);
    target:delMod(MOD_INT, 8);
    target:delMod(MOD_MPHEAL, 4);
end;
