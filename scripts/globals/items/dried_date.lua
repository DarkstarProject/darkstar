-----------------------------------------
-- ID: 5567
-- Item: dried_date
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 10
-- Magic 20
-- Agility -1
-- Intelligence 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5567);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_INT, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_INT, 3);
end;
