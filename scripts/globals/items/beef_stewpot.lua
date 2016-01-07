-----------------------------------------
-- ID: 5547
-- Item: Beef Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 50
-- MP +10
-- HP Recoverd while healing 5
-- MP Recovered while healing 1
-- Attack +15% Cap 40
-- Evasion +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5611);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 50);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_HPHEAL, 5);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_FOOD_ATTP, 15);
    target:addMod(MOD_FOOD_ATT_CAP, 40);
    target:addMod(MOD_EVA, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 50);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_HPHEAL, 5);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_FOOD_ATTP, 15);
    target:delMod(MOD_FOOD_ATT_CAP, 40);
    target:delMod(MOD_EVA, 5);
end;
