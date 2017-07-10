-----------------------------------------
-- ID: 5612
-- Item: Prime Angler Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +15
-- Dexterity 2
-- Agility 1
-- Mind 1
-- HP Recovered while healing 7
-- MP Recovered while healing 2
-- Accuracy 15% Cap 30
-- Ranged Accuracy 15% Cap 30
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5612);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 200);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_FOOD_ACCP, 15);
    target:addMod(MOD_FOOD_ACC_CAP, 30);
    target:addMod(MOD_FOOD_RACCP, 15);
    target:addMod(MOD_FOOD_RACC_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 200);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_FOOD_ACCP, 15);
    target:delMod(MOD_FOOD_ACC_CAP, 30);
    target:delMod(MOD_FOOD_RACCP, 15);
    target:delMod(MOD_FOOD_RACC_CAP, 30);
end;
