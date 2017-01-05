-----------------------------------------
-- ID: 5618
-- Item: bowl_of_zoni_broth
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- HP 10
-- MP 10
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Accuracy +1
-- Ranged Accuracy +1
-- Attack +1
-- Ranged Attack +1
-- Evasion +1
-- HP Recovered While Healing 1
-- MP Recovered While Healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5618);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_ACC, 1);
    target:addMod(MOD_RACC, 1);
    target:addMod(MOD_ATT, 1);
    target:addMod(MOD_RATT, 1);
    target:addMod(MOD_EVA, 1);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_ACC, 1);
    target:delMod(MOD_RACC, 1);
    target:delMod(MOD_ATT, 1);
    target:delMod(MOD_RATT, 1);
    target:delMod(MOD_EVA, 1);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_MPHEAL, 1);
end;
