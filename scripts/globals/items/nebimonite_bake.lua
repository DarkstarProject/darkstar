-----------------------------------------
-- ID: 4459
-- Item: nebimonite_bake
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 1
-- Vitality 2
-- Defense % 25
-- Defense Cap 70
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4459);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 70);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 70);
end;
