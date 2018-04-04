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
-- Defense % 12 (cap 60)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4325);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 15);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_CHR, -7);
    target:addMod(MOD_HPHEAL, 2);
    target:addMod(MOD_FOOD_DEFP, 12);
    target:addMod(MOD_FOOD_DEF_CAP, 60);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 15);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_CHR, -7);
    target:delMod(MOD_HPHEAL, 2);
    target:delMod(MOD_FOOD_DEFP, 12);
    target:delMod(MOD_FOOD_DEF_CAP, 60);
end;
