-----------------------------------------
-- ID: 4394
-- Item: ginger_cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 5
-- Plantoid Killer 5
-- Slow Resist 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,180,4394);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 5);
    target:addMod(MOD_PLANTOID_KILLER, 5);
    target:addMod(MOD_SLOWRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MPHEAL, 5);
    target:delMod(MOD_PLANTOID_KILLER, 5);
    target:delMod(MOD_SLOWRES, 5);
end;
