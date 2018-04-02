-----------------------------------------
-- ID: 5197
-- Item: dish_of_spaghetti_peperoncino_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health % 30
-- Health Cap 75
-- Vitality 2
-- Store TP 6
-- Resist virus +12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5197);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 30);
    target:addMod(MOD_FOOD_HP_CAP, 75);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_VIRUSRES, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 30);
    target:delMod(MOD_FOOD_HP_CAP, 75);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_VIRUSRES, 12);
end;
