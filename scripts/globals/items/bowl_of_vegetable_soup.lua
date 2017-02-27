-----------------------------------------
-- ID: 4560
-- Item: bowl_of_vegetable_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Vitality -1
-- Agility 4
-- Ranged Accuracy 5
-- HP Recovered While Healing 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4560);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_RACC, 5);
    target:addMod(MOD_HPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_RACC, 5);
    target:delMod(MOD_HPHEAL, 3);
end;
