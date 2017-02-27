-----------------------------------------
-- ID: 6460
-- Item: bowl_of_miso_ramen
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +100
-- STR +5
-- VIT +5
-- DEF +10% (cap 170)
-- Magic Evasion +10% (cap 50)
-- Magic Def. Bonus +5
-- Resist Slow +10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6460);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 100);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_FOOD_DEFP, 10);
    target:addMod(MOD_FOOD_DEF_CAP, 170);
    -- target:addMod(MOD_FOOD_MEVAP, 10);
    -- target:addMod(MOD_FOOD_MEVA_CAP, 50);
    target:addMod(MOD_MDEF, 5);
    target:addMod(MOD_SLOWRES, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 100);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_FOOD_DEFP, 10);
    target:delMod(MOD_FOOD_DEF_CAP, 170);
    -- target:delMod(MOD_FOOD_MEVAP, 10);
    -- target:delMod(MOD_FOOD_MEVA_CAP, 50);
    target:delMod(MOD_MDEF, 5);
    target:delMod(MOD_SLOWRES, 10);
end;
