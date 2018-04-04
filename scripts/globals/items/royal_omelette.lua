-----------------------------------------
-- ID: 4564
-- Item: royal_omelette
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Strength 5
-- Dexterity 2
-- Intelligence -3
-- Mind 4
-- Attack % 20 (cap 65)
-- Ranged Attack % 20 (cap 65)
-----------------------------------------
-- IF ELVAAN ONLY
-- HP 20
-- MP 20
-- Strength 6
-- Dexterity 2
-- Intelligence -2
-- Mind 5
-- Charisma 4
-- Attack % 22
-- Attack Cap 80
-- Ranged ATT % 22
-- Ranged ATT Cap 80
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4564);
end;

function onEffectGain(target, effect)
    if (target:getRace() == 3 or target:getRace() == 4) then
        target:addMod(MOD_HP, 20);
        target:addMod(MOD_MP, 20);
        target:addMod(MOD_STR, 6);
        target:addMod(MOD_DEX, 2);
        target:addMod(MOD_INT, -2);
        target:addMod(MOD_MND, 5);
        target:addMod(MOD_CHR, 4);
        target:addMod(MOD_FOOD_ATTP, 22);
        target:addMod(MOD_FOOD_ATT_CAP, 80);
        target:addMod(MOD_FOOD_RATTP, 22);
        target:addMod(MOD_FOOD_RATT_CAP, 80);
    else
        target:addMod(MOD_STR, 5);
        target:addMod(MOD_DEX, 2);
        target:addMod(MOD_INT, -3);
        target:addMod(MOD_MND, 4);
        target:addMod(MOD_FOOD_ATTP, 20);
        target:addMod(MOD_FOOD_ATT_CAP, 65);
        target:addMod(MOD_FOOD_RATTP, 20);
        target:addMod(MOD_FOOD_RATT_CAP, 65);
    end
end;

function onEffectLose(target, effect)
    if (target:getRace() == 3 or target:getRace() == 4) then
        target:delMod(MOD_HP, 20);
        target:delMod(MOD_MP, 20);
        target:delMod(MOD_STR, 6);
        target:delMod(MOD_DEX, 2);
        target:delMod(MOD_INT, -2);
        target:delMod(MOD_MND, 5);
        target:delMod(MOD_CHR, 4);
        target:delMod(MOD_FOOD_ATTP, 22);
        target:delMod(MOD_FOOD_ATT_CAP, 80);
        target:delMod(MOD_FOOD_RATTP, 22);
        target:delMod(MOD_FOOD_RATT_CAP, 80);
    else
        target:delMod(MOD_STR, 5);
        target:delMod(MOD_DEX, 2);
        target:delMod(MOD_INT, -3);
        target:delMod(MOD_MND, 4);
        target:delMod(MOD_FOOD_ATTP, 22);
        target:delMod(MOD_FOOD_ATT_CAP, 65);
        target:delMod(MOD_FOOD_RATTP, 22);
        target:delMod(MOD_FOOD_RATT_CAP, 65);
    end
end;