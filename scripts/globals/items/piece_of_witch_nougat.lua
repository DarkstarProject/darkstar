-----------------------------------------
-- ID: 5645
-- Item: piece_of_witch_nougat
-- Food Effect: 1hour, All Races
-----------------------------------------
-- HP 50
-- Intelligence 3
-- Agility -3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5645);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 50);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_AGI, -3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 50);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_AGI, -3);
end;
