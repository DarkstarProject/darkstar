-----------------------------------------
-- ID: 4325
-- Item: hobgoblin_pie
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 15
-- Magic 15
-- Agility 4
-- Charisma -7
-- Health Regen While Healing 2
-- Defense % 11
-- Defense Cap 60
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4325);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 15);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_CHR, -7);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_FOOD_DEFP, 11);
    target:addMod(MOD_FOOD_DEF_CAP, 60);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 15);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_CHR, -7);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_FOOD_DEFP, 11);
    target:delMod(MOD_FOOD_DEF_CAP, 60);
end;
