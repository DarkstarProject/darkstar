-----------------------------------------
-- ID: 4285
-- Item: bowl_of_ocean_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP +5% (cap 150)
-- MP +5
-- DEX +4
-- Attack +14% (cap 90)
-- Ranged Attack +14% (cap 90)
-- HP recovered while healing +9
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4285);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 5);
    target:addMod(MOD_FOOD_HP_CAP, 150);
    target:addMod(MOD_MP, 5);
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_HPHEAL, 9);
    target:addMod(MOD_FOOD_ATTP, 14);
    target:addMod(MOD_FOOD_ATT_CAP, 90);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 90);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 5);
    target:delMod(MOD_FOOD_HP_CAP, 150);
    target:delMod(MOD_MP, 5);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_HPHEAL, 9);
    target:delMod(MOD_FOOD_ATTP, 14);
    target:delMod(MOD_FOOD_ATT_CAP, 90);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 90);
end;
