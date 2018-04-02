-----------------------------------------
-- ID: 4552
-- Item: serving_of_herb_crawler_eggs
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health % 6
-- Health Cap 80
-- Magic 10
-- Agility 3
-- Vitality -1
-- Evasion 8
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4552);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 80);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_EVA, 8);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 80);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_EVA, 8);
end;
