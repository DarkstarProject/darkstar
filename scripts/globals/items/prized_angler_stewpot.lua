-----------------------------------------
-- ID: 5613
-- Item: Prized Angler's Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +20
-- Dexterity 4
-- Agility 2
-- Mind 2
-- HP Recovered while healing 9
-- MP Recovered while healing 3
-- Accuracy 15% Cap 45
-- Ranged Accuracy 15% Cap 45
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5613);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 200);
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_HPHEAL, 9);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 45);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 45);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 200);
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_HPHEAL, 9);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 45);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 45);
end;
