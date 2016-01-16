-----------------------------------------
-- ID: 5592
-- Item: cup_of_imperial_coffee
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health Regen While Healing 3
-- Magic Regen While Healing 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5592);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 3);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPHEAL, 3);
    target:delMod(MOD_MPHEAL, 3);
end;
