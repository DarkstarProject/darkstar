-----------------------------------------
-- ID: 5169
-- Item: Bataquiche +1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 10
-- Agility 1
-- Vitality -1
-- Ranged ATT % 7
-- Ranged ATT Cap 20
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5169);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_FOOD_RATTP, 7);
    target:addMod(MOD_FOOD_RATT_CAP, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_FOOD_RATTP, 7);
    target:delMod(MOD_FOOD_RATT_CAP, 20);
end;
