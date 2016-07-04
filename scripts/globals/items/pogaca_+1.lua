-----------------------------------------
-- ID: 5638
-- Item: pogaca_+1
-- Food Effect: 5Min, All Races
-----------------------------------------
-- HP Recovered While Healing 6
-- MP Recovered While Healing 6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,360,5638);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_MPHEAL, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_MPHEAL, 6);
end;
