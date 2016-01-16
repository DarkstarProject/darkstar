-----------------------------------------
-- ID: 5763
-- Item: yellow_curry_bun_+1
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- Health Points 30
-- Strength 5
-- Agility 2
-- Vitality 2
-- Intelligence -2
-- Attack 23% (caps @ 80)
-- Ranged Attack 23% (caps @ 80)
-- Resist Sleep
-- Resist Stun
    
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5763);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 23);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_FOOD_RATTP, 23);
    target:addMod(MOD_FOOD_RATT_CAP, 80);
    target:addMod(MOD_SLEEPRES, 5);
    target:addMod(MOD_STUNRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 23);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_FOOD_RATTP, 23);
    target:delMod(MOD_FOOD_RATT_CAP, 80);
    target:delMod(MOD_SLEEPRES, 5);
    target:delMod(MOD_STUNRES, 5);
end;
