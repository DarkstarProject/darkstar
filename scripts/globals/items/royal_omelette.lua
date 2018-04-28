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
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,4564);
end;

function onEffectGain(target, effect)
    if (target:getRace() == 3 or target:getRace() == 4) then
        target:addMod(dsp.mod.HP, 20);
        target:addMod(dsp.mod.MP, 20);
        target:addMod(dsp.mod.STR, 6);
        target:addMod(dsp.mod.DEX, 2);
        target:addMod(dsp.mod.INT, -2);
        target:addMod(dsp.mod.MND, 5);
        target:addMod(dsp.mod.CHR, 4);
        target:addMod(dsp.mod.FOOD_ATTP, 22);
        target:addMod(dsp.mod.FOOD_ATT_CAP, 80);
        target:addMod(dsp.mod.FOOD_RATTP, 22);
        target:addMod(dsp.mod.FOOD_RATT_CAP, 80);
    else
        target:addMod(dsp.mod.STR, 5);
        target:addMod(dsp.mod.DEX, 2);
        target:addMod(dsp.mod.INT, -3);
        target:addMod(dsp.mod.MND, 4);
        target:addMod(dsp.mod.FOOD_ATTP, 20);
        target:addMod(dsp.mod.FOOD_ATT_CAP, 65);
        target:addMod(dsp.mod.FOOD_RATTP, 20);
        target:addMod(dsp.mod.FOOD_RATT_CAP, 65);
    end
end;

function onEffectLose(target, effect)
    if (target:getRace() == 3 or target:getRace() == 4) then
        target:delMod(dsp.mod.HP, 20);
        target:delMod(dsp.mod.MP, 20);
        target:delMod(dsp.mod.STR, 6);
        target:delMod(dsp.mod.DEX, 2);
        target:delMod(dsp.mod.INT, -2);
        target:delMod(dsp.mod.MND, 5);
        target:delMod(dsp.mod.CHR, 4);
        target:delMod(dsp.mod.FOOD_ATTP, 22);
        target:delMod(dsp.mod.FOOD_ATT_CAP, 80);
        target:delMod(dsp.mod.FOOD_RATTP, 22);
        target:delMod(dsp.mod.FOOD_RATT_CAP, 80);
    else
        target:delMod(dsp.mod.STR, 5);
        target:delMod(dsp.mod.DEX, 2);
        target:delMod(dsp.mod.INT, -3);
        target:delMod(dsp.mod.MND, 4);
        target:delMod(dsp.mod.FOOD_ATTP, 22);
        target:delMod(dsp.mod.FOOD_ATT_CAP, 65);
        target:delMod(dsp.mod.FOOD_RATTP, 22);
        target:delMod(dsp.mod.FOOD_RATT_CAP, 65);
    end
end;