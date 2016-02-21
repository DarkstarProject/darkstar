-----------------------------------------
-- ID: 5177
-- Item: plate_of_bream_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 6
-- Vitality 5
-- Accuracy % 17
-- Ranged ACC % 17
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5177);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_FOOD_ACCP, 17);
    target:addMod(MOD_FOOD_RACCP, 17);
    target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_FOOD_ACCP, 17);
    target:delMod(MOD_FOOD_RACCP, 17);
    target:delMod(MOD_SLEEPRES, 5);
end;
