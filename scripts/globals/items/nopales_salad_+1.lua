-----------------------------------------
-- ID: 5702
-- Item: Nopales Salad +1
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Strength 2
-- Agility 7
-- Ranged Accuracy +25
-- Ranged Attack +15
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5702);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_AGI, 7);
    target:addMod(MOD_RACC, 25);
    target:addMod(MOD_RATT, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_AGI, 7);
    target:delMod(MOD_RACC, 25);
    target:delMod(MOD_RATT, 15);
end;
