-----------------------------------------
-- ID: 5765
-- Item: red_curry_bun_+1
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Health 35
-- Strength 7
-- Agility 3
-- Attack % 25 (cap 150)
-- Ranged Atk % 25 (cap 150)
-- Demon Killer 5
-- HP recovered when healing +6
-- MP recovered when healing +3

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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5765);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 35);
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_FOOD_ATTP, 25);
    target:addMod(MOD_FOOD_ATT_CAP, 150);
    target:addMod(MOD_FOOD_RATTP, 25);
    target:addMod(MOD_FOOD_RATT_CAP, 150);
    target:addMod(MOD_DEMON_KILLER, 5);
    target:addMod(MOD_HPHEAL, 6);
    target:addMod(MOD_MPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 35);
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_FOOD_ATTP, 25);
    target:delMod(MOD_FOOD_ATT_CAP, 150);
    target:delMod(MOD_FOOD_RATTP, 25);
    target:delMod(MOD_FOOD_RATT_CAP, 150);
    target:delMod(MOD_DEMON_KILLER, 6);
    target:delMod(MOD_HPHEAL, 6);
    target:delMod(MOD_MPHEAL, 3);
end;