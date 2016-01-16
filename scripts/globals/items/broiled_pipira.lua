-----------------------------------------
-- ID: 4585
-- Item: Broiled Pipira
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -1
-- Attack % 14
-- Ranged ATT % 14
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4585);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_ATTP, 14);
    target:addMod(MOD_RATTP, 14);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_ATTP, 14);
    target:delMod(MOD_RATTP, 14);
end;
