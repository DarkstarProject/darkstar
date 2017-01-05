-----------------------------------------
-- ID: 5763
-- Item: yellow_curry_bun_+1
-- Food Effect: 60 min, All Races
-----------------------------------------
-- TODO: Group effects
-- Health Points 30
-- Strength 5
-- Vitality 2
-- Agility 3
-- Intelligence -2
-- Attack 22% (caps @ 85)
-- Ranged Attack 22% (caps @ 85)
-- Resist Sleep +5
-- Resist Stun +6
-- hHP +6
-- hMP +3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5763);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 85);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 85);
    target:addMod(MOD_SLEEPRES, 5);
    target:addMod(MOD_STUNRES, 6);
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 85);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 85);
    target:delMod(MOD_SLEEPRES, 5);
    target:delMod(MOD_STUNRES, 6);
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_MPHEAL, 3);
end;
