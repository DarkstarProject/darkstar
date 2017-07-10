-----------------------------------------
-- ID: 5549
-- Item: Prized Angler's Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 100
-- MP +20
-- Strength +4
-- Agility +2
-- Mind +2
-- HP Recovered while healing +9
-- MP Recovered while healing +3
-- Attack 18% Cap 80
-- Evasion +7
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5549);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 100);
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_HPHEAL, 9);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_EVA, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 100);
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_HPHEAL, 9);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_EVA, 7);
end;
