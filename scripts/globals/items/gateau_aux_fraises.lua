-----------------------------------------
-- ID: 5542
-- Item: Gateau aux fraises
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP 8
-- MP 8% Cap 50
-- Intelligence 1
-- MP Recovered while healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5542);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 8);
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_FOOD_MPP, 8);
    target:addMod(MOD_FOOD_MP_CAP, 50);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 8);
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_FOOD_MPP, 8);
    target:delMod(MOD_FOOD_MP_CAP, 50);
    target:delMod(MOD_MPHEAL, 1);
end;
