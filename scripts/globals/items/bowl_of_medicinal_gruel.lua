-----------------------------------------
-- ID: 4534
-- Item: bowl_of_medicinal_gruel
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- Vitality -1
-- Agility 2
-- Ranged Accuracy % 15 (cap 15)
-- HP Recovered While Healing 4
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,14400,4534);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
    target:addMod(MOD_HPHEAL, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
    target:delMod(MOD_HPHEAL, 4);
end;
