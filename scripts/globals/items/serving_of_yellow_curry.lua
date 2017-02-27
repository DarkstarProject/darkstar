-----------------------------------------
-- ID: 4517
-- Item: serving_of_yellow_curry
-- Food Effect: 3hours, All Races
-----------------------------------------
-- Health Points 20
-- Strength 5
-- Agility 2
-- Intelligence -4
-- HP Recovered While Healing 2
-- MP Recovered While Healing 1 
-- Attack 21% (caps @ 75)
-- Ranged Attack 21% (caps @ 75)
-- Resist Sleep +3
-- Resist Stun +4

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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4517);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_INT, -4);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_FOOD_ATTP, 21);
    target:addMod(MOD_FOOD_ATT_CAP, 75);
    target:addMod(MOD_FOOD_RATTP, 21);
    target:addMod(MOD_FOOD_RATT_CAP, 75);
    target:addMod(MOD_SLEEPRES, 3);
    target:addMod(MOD_STUNRES, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_INT, -4);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_FOOD_ATTP, 21);
    target:delMod(MOD_FOOD_ATT_CAP, 75);
    target:delMod(MOD_FOOD_RATTP, 21);
    target:delMod(MOD_FOOD_RATT_CAP, 75);
    target:delMod(MOD_SLEEPRES, 3);
    target:delMod(MOD_STUNRES, 4);
end;
