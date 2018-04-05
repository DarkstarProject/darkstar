-----------------------------------------
-- ID: 4430
-- Item: bowl_of_pumpkin_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP % 1 (cap 110)
-- Vitality -1
-- Agility 3
-- HP Recovered While Healing 5
-- Ranged Accuracy % 8 (cap 20)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4430);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 1);
    target:addMod(MOD_FOOD_HP_CAP, 110);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_FOOD_RACCP, 8);
    target:addMod(MOD_FOOD_RACC_CAP, 20);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 1);
    target:delMod(MOD_FOOD_HP_CAP, 110);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_FOOD_RACCP, 8);
    target:delMod(MOD_FOOD_RACC_CAP, 20);
end;
