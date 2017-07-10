-----------------------------------------
-- ID: 5589
-- Item: serving_of_karni_yarik_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Agility 4
-- Vitality -2
-- Attack % 22 (cap 70)
-- Ranged Attack % 22 (cap 70)
-- Evasion +7
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5589);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_VIT, -2);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 70);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 70);
    target:addMod(MOD_EVA, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_VIT, -2);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 70);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 70);
    target:delMod(MOD_EVA, 7);
end;
