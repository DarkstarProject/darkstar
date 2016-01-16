
-----------------------------------------
-- ID: 4331
-- Item: imperial_omelette
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Non Elvaan Stats
-- Strength 5
-- Dexterity 2
-- Intelligence -3
-- Mind 4
-- Attack % 22
-- Attack Cap 70
-- Ranged ATT % 22
-- Ranged ATT Cap 70
-----------------------------------------
-- Elvaan Stats
-- Strength 6
-- Health 20
-- Elvaan Stats
-- Strength 6
-- Health 20
-- Magic 20
-- Intelligence -2
-- Mind 5
-- Charisma 4
-- Attack % 22
-- Attack Cap 85
-- Ranged ATT % 22
-- Ranged ATT Cap 85
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4331);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getRace() ~= 4) then
        target:addMod(MOD_STR, 5);
        target:addMod(MOD_DEX, 2);
        target:addMod(MOD_INT, -3);
        target:addMod(MOD_MND, 4);
        target:addMod(MOD_FOOD_ATTP, 22);
        target:addMod(MOD_FOOD_ATT_CAP, 70);
        target:addMod(MOD_FOOD_RATTP, 22);
        target:addMod(MOD_FOOD_RATT_CAP, 70);
    else
        target:addMod(MOD_HP, 20);
        target:addMod(MOD_MP, 20);
        target:addMod(MOD_STR, 6);
        target:addMod(MOD_DEX, 2);
        target:addMod(MOD_INT, -2);
        target:addMod(MOD_MND, 5);
        target:addMod(MOD_CHR, 4);
        target:addMod(MOD_FOOD_ATTP, 22);
        target:addMod(MOD_FOOD_ATT_CAP, 85);
        target:addMod(MOD_FOOD_RATTP, 22);
        target:addMod(MOD_FOOD_RATT_CAP, 85);
    end
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    if (target:getRace() ~= 4) then
        target:delMod(MOD_STR, 5);
        target:delMod(MOD_DEX, 2);
        target:delMod(MOD_INT, -3);
        target:delMod(MOD_MND, 4);
        target:delMod(MOD_FOOD_ATTP, 22);
        target:delMod(MOD_FOOD_ATT_CAP, 70);
        target:delMod(MOD_FOOD_RATTP, 22);
        target:delMod(MOD_FOOD_RATT_CAP, 70);
    else
        target:delMod(MOD_HP, 20);
        target:delMod(MOD_MP, 20);
        target:delMod(MOD_STR, 6);
        target:delMod(MOD_DEX, 2);
        target:delMod(MOD_INT, -2);
        target:delMod(MOD_MND, 5);
        target:delMod(MOD_CHR, 4);
        target:delMod(MOD_FOOD_ATTP, 22);
        target:delMod(MOD_FOOD_ATT_CAP, 85);
        target:delMod(MOD_FOOD_RATTP, 22);
        target:delMod(MOD_FOOD_RATT_CAP, 85);
    end
end;
