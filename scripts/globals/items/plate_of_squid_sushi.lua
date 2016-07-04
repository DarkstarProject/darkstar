-----------------------------------------
-- ID: 5148
-- Item: plate_of_squid_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 30
-- Dexterity 6
-- Agility 5
-- Mind -1
-- Accuracy % 15
-- Ranged ACC % 15
-- Sleep Resist 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5148);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_SLEEPRES, 5);
end;
