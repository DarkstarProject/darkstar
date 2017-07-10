-----------------------------------------
-- ID: 6461
-- Item: bowl_of_miso_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +105
-- STR +6
-- VIT +6
-- DEF +11% (cap 175)
-- Magic Evasion +11% (cap 55)
-- Magic Def. Bonus +6
-- Resist Slow +15
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6461);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 105);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_VIT, 6);
    target:addMod(MOD_FOOD_DEFP, 11);
    target:addMod(MOD_FOOD_DEF_CAP, 175);
    -- target:addMod(MOD_FOOD_MEVAP, 11);
    -- target:addMod(MOD_FOOD_MEVA_CAP, 55);
    target:addMod(MOD_MDEF, 6);
    target:addMod(MOD_SLOWRES, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 105);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_VIT, 6);
    target:delMod(MOD_FOOD_DEFP, 11);
    target:delMod(MOD_FOOD_DEF_CAP, 175);
    -- target:delMod(MOD_FOOD_MEVAP, 11);
    -- target:delMod(MOD_FOOD_MEVA_CAP, 55);
    target:delMod(MOD_MDEF, 6);
    target:delMod(MOD_SLOWRES, 15);
end;
