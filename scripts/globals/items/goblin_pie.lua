-----------------------------------------
-- ID: 4539
-- Item: goblin_pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 12
-- Magic 12
-- Dexterity -1
-- Agility 3
-- Vitality -1
-- Charisma -5
-- Defense % 9 (cap 100)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4539);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_MP, 12);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_CHR, -5);
    target:addMod(MOD_FOOD_DEFP, 9);
    target:addMod(MOD_FOOD_DEF_CAP, 100);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_MP, 12);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_CHR, -5);
    target:delMod(MOD_FOOD_DEFP, 9);
    target:delMod(MOD_FOOD_DEF_CAP, 100);
end;
