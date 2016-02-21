-----------------------------------------
-- ID: 4511
-- Item: Bowl of Ambrosia
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Health 7
-- Magic 7
-- Strength 7
-- Dexterity 7
-- Agility 7
-- Vitality 7
-- Intelligence 7
-- Mind 7
-- Charisma 7
-- Health Regen While Healing 7
-- Magic Regen While Healing 7
-- Attack 7
-- defense 7
-- Accuracy 7
-- Evasion 7
-- Store TP 7
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4511);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 7);
    target:addMod(MOD_MP, 7);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_DEX, 7);
    target:addMod(MOD_AGI, 7);
    target:addMod(MOD_VIT, 7);
    target:addMod(MOD_INT, 7);
    target:addMod(MOD_MND, 7);
    target:addMod(MOD_CHR, 7);
    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_MPHEAL, 7);
    target:addMod(MOD_ATT, 7);
    target:addMod(MOD_DEF, 7);
    target:addMod(MOD_ACC, 7);
    target:addMod(MOD_EVA, 7);
    target:addMod(MOD_STORETP, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 7);
    target:delMod(MOD_MP, 7);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_DEX, 7);
    target:delMod(MOD_AGI, 7);
    target:delMod(MOD_VIT, 7);
    target:delMod(MOD_INT, 7);
    target:delMod(MOD_MND, 7);
    target:delMod(MOD_CHR, 7);
    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_MPHEAL, 7);
    target:delMod(MOD_ATT, 7);
    target:delMod(MOD_DEF, 7);
    target:delMod(MOD_ACC, 7);
    target:delMod(MOD_EVA, 7);
    target:delMod(MOD_STORETP, 7);
end;
