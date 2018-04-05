-----------------------------------------
-- ID: 5214
-- Item: dish_of_spaghetti_melanzane_+1
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- HP % 25 (cap 105)
-- Vitality 2
-- Store TP 6
-- Resist sleep 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5214);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 25);
    target:addMod(MOD_FOOD_HP_CAP, 105);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_SLEEPRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 25);
    target:delMod(MOD_FOOD_HP_CAP, 105);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_SLEEPRES, 10);
end;
