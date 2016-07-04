-----------------------------------------
-- ID: 4452
-- Item: bowl_of_shark_fin_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP % 5
-- MP 5
-- Dexterity 4
-- Mind -4
-- HP Recovered While Healing 9
-- Attack % 14 (cap 60)
-- Ranged Attack % 14 (cap 60)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4452);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 5);
    target:addMod(MOD_FOOD_HP_CAP, 999);
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_MND, -4);
    target:addMod(MOD_HPHEAL, 9);
    target:addMod(MOD_FOOD_ATTP, 14);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 60);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 5);
    target:delMod(MOD_FOOD_HP_CAP, 999);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_MND, -4);
    target:delMod(MOD_HPHEAL, 9);
    target:delMod(MOD_FOOD_ATTP, 14);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 60);
end;
