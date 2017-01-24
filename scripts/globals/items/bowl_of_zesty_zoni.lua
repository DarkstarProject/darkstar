-----------------------------------------
-- ID: 5619
-- Item: Bowl of Zesti Zoni
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 12
-- MP 12
-- Strength 2
-- Dexterity 2
-- Vitality 2
-- Agility 2
-- Accuracy +2
-- Ranged Accuracy +2
-- Attack +2
-- Ranged Attack +2
-- Evasion +2
-- MP Recovered while healing 1
-- HP Recovered while healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5619);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_MP, 12);
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_ACC, 2);
    target:addMod(MOD_RACC, 2);
    target:addMod(MOD_ATT, 2);
    target:addMod(MOD_RATT, 2);
    target:addMod(MOD_EVA, 2);
    target:addMod(MOD_HPHEAL, 1);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_MP, 12);
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_ACC, 2);
    target:delMod(MOD_RACC, 2);
    target:delMod(MOD_ATT, 2);
    target:delMod(MOD_RATT, 2);
    target:delMod(MOD_EVA, 2);
    target:delMod(MOD_HPHEAL, 1);
    target:delMod(MOD_MPHEAL, 1);
end;
