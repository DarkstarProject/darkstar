-----------------------------------------
-- ID: 4489
-- Item: bowl_of_vegetable_gruel
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Vitality -1
-- Agility 2
-- Ranged Accuracy % 15 (cap 10)
-- HP Recovered While Healing 4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4489);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 10);
    target:addMod(MOD_HPHEAL, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 10);
    target:delMod(MOD_HPHEAL, 4);
end;
