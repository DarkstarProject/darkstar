-----------------------------------------
-- ID: 4458
-- Item: loaf_of_goblin_bread
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 7
-- Vitality 1
-- Charisma -5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4458);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 7);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_CHR, -5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 7);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_CHR, -5);
end;
