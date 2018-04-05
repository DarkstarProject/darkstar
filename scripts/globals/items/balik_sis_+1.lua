-----------------------------------------
-- ID: 5601
-- Item: Balik Sis +1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 5
-- Mind -2
-- Attack % 15
-- Attack Cap 70
-- Ranged ACC 2
-- Ranged ATT % 15
-- Ranged ATT Cap 70
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5601);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 5);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_ATTP, 15);
    target:addMod(MOD_FOOD_ATT_CAP, 70);
    target:addMod(MOD_RACC, 2);
    target:addMod(MOD_FOOD_RATTP, 15);
    target:addMod(MOD_FOOD_RATT_CAP, 70);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 5);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_ATTP, 15);
    target:delMod(MOD_FOOD_ATT_CAP, 70);
    target:delMod(MOD_RACC, 2);
    target:delMod(MOD_FOOD_RATTP, 15);
    target:delMod(MOD_FOOD_RATT_CAP, 70);
end;
