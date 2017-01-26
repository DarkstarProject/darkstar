-----------------------------------------
-- ID: 5925
-- Item: Charred Salisbury Steak
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- HP +32
-- Strength +8
-- Intelligence -6
-- Attack % 22 Cap 165
-- Ranged Attack %22 Cap 165
-- Dragon Killer +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5925);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 32);
    target:addMod(MOD_STR, 8);
    target:addMod(MOD_INT, -6);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 165);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 165);
    target:addMod(MOD_DRAGON_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 32);
    target:delMod(MOD_STR, 8);
    target:delMod(MOD_INT, -6);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 165);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 165);
    target:delMod(MOD_DRAGON_KILLER, 5);
end;
