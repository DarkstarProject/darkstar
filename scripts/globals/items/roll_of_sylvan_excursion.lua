-----------------------------------------
-- ID: 5551
-- Item: Roll of Sylvan Excursion
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10
-- MP +3% Cap 15
-- Intelligence +3
-- HP Recovered while healing +2
-- MP Recovered while healing +5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5551);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 3);
    target:addMod(MOD_FOOD_MP_CAP, 15);
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 3);
    target:delMod(MOD_FOOD_MP_CAP, 15);
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 5);
end;
