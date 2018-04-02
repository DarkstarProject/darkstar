-----------------------------------------
-- ID: 4522
-- Item: Bowl of Jack-o'-Soup
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health % 2 (cap 120)
-- Agility 3
-- Vitality -1
-- Health Regen While Healing 5
-- Ranged ACC % 8
-- Ranged ACC Cap 25
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4522);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 2);
    target:addMod(MOD_FOOD_HP_CAP, 120);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_FOOD_RACCP, 8);
    target:addMod(MOD_FOOD_RACC_CAP, 25);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 2);
    target:delMod(MOD_FOOD_HP_CAP, 120);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_FOOD_RACCP, 8);
    target:delMod(MOD_FOOD_RACC_CAP, 25);
end;
