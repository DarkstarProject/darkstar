-----------------------------------------
-- ID: 6274
-- Item: pukatrice_egg
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +15
-- MP +15
-- STR +2
-- Fire resistance +20
-- Attack +20% (cap 85)
-- Ranged Attack +20% (cap 85)
-- Subtle Blow +8
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6274);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 15);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_FIRERES, 20);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 85);
    target:addMod(MOD_FOOD_RATTP, 20);
    target:addMod(MOD_FOOD_RATT_CAP, 85);
    target:addMod(MOD_SUBTLE_BLOW, 8);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 15);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_FIRERES, 20);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 85);
    target:delMod(MOD_FOOD_RATTP, 20);
    target:delMod(MOD_FOOD_RATT_CAP, 85);
    target:delMod(MOD_SUBTLE_BLOW, 8);
end;
