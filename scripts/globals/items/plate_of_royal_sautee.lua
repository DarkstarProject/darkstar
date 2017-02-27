-----------------------------------------
-- ID: 4295
-- Item: plate_of_royal_sautee
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Attack +22% (cap 80)
-- Ranged Attack +22% (cap 80)
-- Stun Resist +4
-- HP recovered while healing +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4295);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 80);
    target:addMod(MOD_STUNRES, 4);
    target:addMod(MOD_HPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 80);
    target:delMod(MOD_STUNRES, 4);
    target:delMod(MOD_HPHEAL, 1);
end;
