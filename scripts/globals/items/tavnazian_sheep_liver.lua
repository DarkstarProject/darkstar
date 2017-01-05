-----------------------------------------
-- ID: 5154
-- Item: Tavnazian Sheep Liver
-- Food Effect: 5Min, Galka only
-----------------------------------------
-- Strength 2
-- Intelligence -4
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 8) then
        result = 247;
    elseif (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5154);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_INT, -4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_INT, -4);
end;
