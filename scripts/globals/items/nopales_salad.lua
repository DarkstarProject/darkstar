-----------------------------------------
-- ID: 5701
-- Item: nopales_salad
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Strength 1
-- Agility 6
-- Ranged Accuracy +20
-- Ranged Attack +10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5701);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_AGI, 6);
    target:addMod(MOD_RACC, 20);
    target:addMod(MOD_RATT, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_AGI, 6);
    target:delMod(MOD_RACC, 20);
    target:delMod(MOD_RATT, 10);
end;
