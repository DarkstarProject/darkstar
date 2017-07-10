-----------------------------------------
-- ID: 4592
-- Item: bowl_of_wisdom_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 3
-- MP 3
-- Strength 1
-- Dexterity 1
-- Agility 1
-- Vitality 1
-- Intelligence 1
-- Mind 1
-- Charisma 1
-- HP Recovered While Healing 3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4592);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 3);
    target:addMod(MOD_MP, 3);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_CHR, 1);
    target:addMod(MOD_HPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 3);
    target:delMod(MOD_MP, 3);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_CHR, 1);
    target:delMod(MOD_HPHEAL, 3);
end;
