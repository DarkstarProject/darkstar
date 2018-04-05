-----------------------------------------
-- ID: 5201
-- Item: dish_of_spaghetti_boscaiola_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 18
-- Health Cap 130
-- Magic 40
-- Strength -5
-- Dexterity -2
-- Vitality 2
-- Mind 4
-- Store TP +6
-- Magic Regen While Healing 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5201);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 18);
    target:addMod(MOD_FOOD_HP_CAP, 130);
    target:addMod(MOD_MP, 40);
    target:addMod(MOD_STR, -5);
    target:addMod(MOD_DEX, -2);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_MND, 4);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 18);
    target:delMod(MOD_FOOD_HP_CAP, 130);
    target:delMod(MOD_MP, 40);
    target:delMod(MOD_STR, -5);
    target:delMod(MOD_DEX, -2);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_MND, 4);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_MPHEAL, 1);
end;
