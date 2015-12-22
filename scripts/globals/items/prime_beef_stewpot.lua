-----------------------------------------
-- ID: 5548
-- Item: Prime Beef Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 75
-- MP +15
-- Strength +2
-- Agility +1
-- Mind +1
-- HP Recovered while healing +7
-- MP Recovered while healing +2
-- Attack 18% Cap 60
-- Evasion +6
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5548);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 75);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_MND, 1);
    target:addMod(MOD_HPHEAL, 7);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_EVA, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 75);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_MND, 1);
    target:delMod(MOD_HPHEAL, 7);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_EVA, 6);
end;
