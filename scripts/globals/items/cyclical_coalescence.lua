-----------------------------------------
-- ID: 6225
-- Item: Cyclical coalescence
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +30% (cap 110)
-- INT +7
-- MND +7
-- Magic Atk. Bonus +15
-- Lizard Killer +7
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6225);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 30)
    target:addMod(MOD_FOOD_MP_CAP, 110)
    target:addMod(MOD_INT, 7)
    target:addMod(MOD_MND, 7)
    target:addMod(MOD_MATT, 15)
    target:addMod(MOD_LIZARD_KILLER, 7)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 30)
    target:delMod(MOD_FOOD_MP_CAP, 110)
    target:delMod(MOD_INT, 7)
    target:delMod(MOD_MND, 7)
    target:delMod(MOD_MATT, 15)
    target:delMod(MOD_LIZARD_KILLER, 7)
end;
