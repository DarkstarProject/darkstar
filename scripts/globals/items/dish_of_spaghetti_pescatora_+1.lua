-----------------------------------------
-- ID: 5200
-- Item: dish_of_spaghetti_pescatora_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health % 15
-- Health Cap 160
-- Vitality 3
-- Mind -1
-- Defense % 22
-- Defense Cap 70
-- Store TP 6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5200);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 15);
    target:addMod(MOD_FOOD_HP_CAP, 160);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_DEFP, 22);
    target:addMod(MOD_FOOD_DEF_CAP, 70);
    target:addMod(MOD_STORETP, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 15);
    target:delMod(MOD_FOOD_HP_CAP, 160);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_DEFP, 22);
    target:delMod(MOD_FOOD_DEF_CAP, 70);
    target:delMod(MOD_STORETP, 6);
end;
