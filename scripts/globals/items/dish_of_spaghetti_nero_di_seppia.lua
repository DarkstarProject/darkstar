-----------------------------------------
-- ID: 5193
-- Item: dish_of_spaghetti_nero_di_seppia
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP % 17 (cap 130)
-- Dexterity 3
-- Vitality 2
-- Agility -1
-- Mind -2
-- Charisma -1
-- Double Attack 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5193);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 17);
    target:addMod(MOD_FOOD_HP_CAP, 130);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_CHR, -1);
    target:addMod(MOD_DOUBLE_ATTACK, 1);
    target:addMod(MOD_STORETP, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 17);
    target:delMod(MOD_FOOD_HP_CAP, 130);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_CHR, -1);
    target:delMod(MOD_DOUBLE_ATTACK, 1);
    target:delMod(MOD_STORETP, 6);
end;
