-----------------------------------------
-- ID: 5683
-- Item: humpty_dumpty_effigy
-- Food Effect: 3 hours, All Races
-----------------------------------------
-- Max HP % 6 (cap 160)
-- Max MP % 6 (cap 160)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5683);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 160);
    target:addMod(MOD_FOOD_MPP, 6);
    target:addMod(MOD_FOOD_MP_CAP, 160);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 160);
    target:delMod(MOD_FOOD_MPP, 6);
    target:delMod(MOD_FOOD_MP_CAP, 160);
end;
