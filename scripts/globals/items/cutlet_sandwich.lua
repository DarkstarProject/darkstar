-----------------------------------------
-- ID: 6396
-- Item: cutlet_sandwich
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +40
-- STR +7
-- INT -7
-- Fire resistance +20
-- Attack +20% (cap 120)
-- Ranged Attack +20% (cap 120)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,6396);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_INT, -7);
    target:addMod(MOD_FIRERES, 20);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 120);
    target:addMod(MOD_FOOD_RATTP, 20);
    target:addMod(MOD_FOOD_RATT_CAP, 120);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_INT, -7);
    target:delMod(MOD_FIRERES, 20);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 120);
    target:delMod(MOD_FOOD_RATTP, 20);
    target:delMod(MOD_FOOD_RATT_CAP, 120);
end;
