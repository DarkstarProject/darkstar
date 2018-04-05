-----------------------------------------
-- ID: 5624
-- Item: Dish of Spaghetti Tonno Rosso +1
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- Health % 13
-- Health Cap 185
-- Dexterity 2
-- Vitality 3
-- Store TP +6
-- hMP +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,7200,5624);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 13);
    target:addMod(MOD_FOOD_HP_CAP, 185);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_HPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 13);
    target:delMod(MOD_FOOD_HP_CAP, 185);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_HPHEAL, 1);
end;
