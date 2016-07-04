-----------------------------------------
-- ID: 5727
-- Item: serving_of_zaru_soba
-- Food Effect: 30Min?, All Races
-----------------------------------------
-- Agility 3
-- HP % 12 (cap 180)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5727);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_FOOD_HPP, 12);
    target:addMod(MOD_FOOD_HP_CAP, 180);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_FOOD_HPP, 12);
    target:delMod(MOD_FOOD_HP_CAP, 180);
end;
