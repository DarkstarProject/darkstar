-----------------------------------------
-- ID: 4417
-- Item: Bowl of Egg Soup
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health % 6
-- Health Cap 30
-- Magic 5
-- Health Regen While Healing 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4417);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 30);
    target:addMod(MOD_MP, 5);
    target:addMod(MOD_HPHEAL, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 30);
    target:delMod(MOD_MP, 5);
    target:delMod(MOD_HPHEAL, 5);
end;
