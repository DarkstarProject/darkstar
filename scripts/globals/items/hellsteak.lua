-----------------------------------------
-- ID: 5609
-- Item: hellsteak
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 20
-- Strength 6
-- Intelligence -2
-- Health Regen While Healing 2
-- Attack % 19
-- Ranged ATT % 19
-- Dragon Killer 5
-- Demon Killer 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5609);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_ATTP, 19);
    target:addMod(MOD_RATTP, 19);
    target:addMod(MOD_DRAGON_KILLER, 5);
    target:addMod(MOD_DEMON_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_ATTP, 19);
    target:delMod(MOD_RATTP, 19);
    target:delMod(MOD_DRAGON_KILLER, 5);
    target:delMod(MOD_DEMON_KILLER, 5);
end;
