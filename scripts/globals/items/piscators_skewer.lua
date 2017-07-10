-----------------------------------------
-- ID: 5983
-- Item: Piscator's Skewer
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- Dexterity 3
-- Vitality 4
-- Defense % 26 Cap 155
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5983);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_FOOD_DEFP, 26);
    target:addMod(MOD_FOOD_DEF_CAP, 155);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_FOOD_DEFP, 26);
    target:delMod(MOD_FOOD_DEF_CAP, 155);
end;
