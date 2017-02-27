-----------------------------------------
-- ID: 6224
-- Item: Apingaut snow cone
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- MP +25% (cap 105)
-- INT +6
-- MND +6
-- Magic Atk. Bonus +14
-- Lizard Killer +6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6224);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 25)
    target:addMod(MOD_FOOD_MP_CAP, 105)
    target:addMod(MOD_INT, 6)
    target:addMod(MOD_MND, 6)
    target:addMod(MOD_MATT, 14)
    target:addMod(MOD_LIZARD_KILLER, 6)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 25)
    target:delMod(MOD_FOOD_MP_CAP, 105)
    target:delMod(MOD_INT, 6)
    target:delMod(MOD_MND, 6)
    target:delMod(MOD_MATT, 14)
    target:delMod(MOD_LIZARD_KILLER, 6)
end;
