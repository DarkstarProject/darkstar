-----------------------------------------
-- ID: 5159
-- Item: plate_of_friture_de_la_misareaux
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity 3
-- Vitality 3
-- Mind -3
-- Defense 5
-- Ranged ATT % 7
-- Ranged ATT Cap 15
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5159);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_DEF, 5);
    target:addMod(MOD_FOOD_RATTP, 7);
    target:addMod(MOD_FOOD_RATT_CAP, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_DEF, 5);
    target:delMod(MOD_FOOD_RATTP, 7);
    target:delMod(MOD_FOOD_RATT_CAP, 15);
end;
