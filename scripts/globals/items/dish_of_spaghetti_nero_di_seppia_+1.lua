-----------------------------------------
-- ID: 5202
-- Item: Dish of Spaghetti Nero Di Seppia +1
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- HP % 17 (cap 140)
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
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5202);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 17);
    target:addMod(MOD_FOOD_HP_CAP, 140);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_CHR, -1);
    target:addMod(MOD_DOUBLE_ATTACK, 1);
    target:addMod(MOD_STORETP, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 17);
    target:delMod(MOD_FOOD_HP_CAP, 140);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_CHR, -1);
    target:delMod(MOD_DOUBLE_ATTACK, 1);
    target:delMod(MOD_STORETP, 6);
end;
