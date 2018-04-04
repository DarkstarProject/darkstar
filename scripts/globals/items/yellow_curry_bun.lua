-----------------------------------------
-- ID: 5757
-- Item: yellow_curry_bun
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- TODO: Group effects
-- Health Points 20
-- Strength 5
-- Agility 2
-- Intelligence -4
-- Attack 20% (caps @ 75)
-- Ranged Attack 20% (caps @ 75)
-- Resist Sleep +3
-- Resist Stun +4
-- hHP +2
-- hMP +1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5757);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_INT, -4);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 75);
    target:addMod(MOD_FOOD_RATTP, 20);
    target:addMod(MOD_FOOD_RATT_CAP, 75);
    target:addMod(MOD_SLEEPRES, 3);
    target:addMod(MOD_STUNRES, 4);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_INT, -4);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 75);
    target:delMod(MOD_FOOD_RATTP, 20);
    target:delMod(MOD_FOOD_RATT_CAP, 75);
    target:delMod(MOD_SLEEPRES, 3);
    target:delMod(MOD_STUNRES, 4);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_MPHEAL, 1);
end;
