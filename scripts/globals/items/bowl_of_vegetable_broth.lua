-----------------------------------------
-- ID: 4323
-- Item: bowl_of_vegetable_broth
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Vitality -1
-- Agility 5
-- Ranged Accuracy 6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4323);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_RACC, 6);
    target:addMod(MOD_HPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_RACC, 6);
    target:delMod(MOD_HPHEAL, 3);
end;
