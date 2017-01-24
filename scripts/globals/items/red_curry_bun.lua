-----------------------------------------
-- ID: 5759
-- Item: red_curry_bun
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- TODO: Group effects
-- Health 25
-- Strength 7
-- Agility 1
-- Intelligence -2
-- Attack % 23 (cap 150)
-- Ranged Atk % 23 (cap 150)
-- Demon Killer 4
-- Resist Sleep +3
-- HP recovered when healing +2
-- MP recovered when healing +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5759);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 23);
    target:addMod(MOD_FOOD_ATT_CAP, 150);
    target:addMod(MOD_FOOD_RATTP, 23);
    target:addMod(MOD_FOOD_RATT_CAP, 150);
    target:addMod(MOD_DEMON_KILLER, 4);
    target:addMod(MOD_SLEEPRES, 3);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 23);
    target:delMod(MOD_FOOD_ATT_CAP, 150);
    target:delMod(MOD_FOOD_RATTP, 23);
    target:delMod(MOD_FOOD_RATT_CAP, 150);
    target:delMod(MOD_DEMON_KILLER, 4);
    target:delMod(MOD_SLEEPRES, 3);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
end;