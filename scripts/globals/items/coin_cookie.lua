-----------------------------------------
-- ID: 4520
-- Item: coin_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Magic Regen While Healing 6
-- Vermin Killer 5
-- Poison Resist 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4520);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 6);
    target:addMod(MOD_VERMIN_KILLER, 5);
    target:addMod(MOD_POISONRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MPHEAL, 6);
    target:delMod(MOD_VERMIN_KILLER, 5);
    target:delMod(MOD_POISONRES, 5);
end;
