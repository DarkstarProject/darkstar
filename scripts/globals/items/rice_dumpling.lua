-----------------------------------------
-- ID: 4271
-- Item: rice_dumpling
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- HP 17
-- Strength 3
-- Vitality 2
-- Agility 1
-- Attack 20% (caps @ 45)
-- Ranged Attack 30% (caps @ 45)
-- HP Regeneration While Healing 2
-- MP Regeneration While Healing 2
-- Accuracy 5
-- Resist Paralyze +4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4271);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 17);
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 45);
    target:addMod(MOD_FOOD_RATTP, 30);
    target:addMod(MOD_FOOD_RATT_CAP, 45);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_ACC, 5);
    target:addMod(MOD_PARALYZERES, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 17);
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 45);
    target:delMod(MOD_FOOD_RATTP, 30);
    target:delMod(MOD_FOOD_RATT_CAP, 45);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_ACC, 5);
    target:delMod(MOD_PARALYZERES, 4);
end;
