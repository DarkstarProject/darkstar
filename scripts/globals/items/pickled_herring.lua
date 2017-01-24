-----------------------------------------
-- ID: 4490
-- Item: Pickled Herring
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 3
-- Mind -3
-- Attack % 12 (cap 70)
-- Ranged ATT % 12 (cap 70)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4490);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_MND, -3);
    target:addMod(MOD_FOOD_ATTP, 12);
    target:addMod(MOD_FOOD_ATT_CAP, 70);
    target:addMod(MOD_FOOD_RATTP, 12);
    target:addMod(MOD_FOOD_RATT_CAP, 70);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_MND, -3);
    target:delMod(MOD_FOOD_ATTP, 12);
    target:delMod(MOD_FOOD_ATT_CAP, 70);
    target:delMod(MOD_FOOD_RATTP, 12);
    target:delMod(MOD_FOOD_RATT_CAP, 70);
end;
