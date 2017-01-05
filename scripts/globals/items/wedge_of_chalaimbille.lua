-----------------------------------------
-- ID: 5684
-- Item: wedge_of_chalaimbille
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 6 (cap 40)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5684);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 40);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 40);
end;
