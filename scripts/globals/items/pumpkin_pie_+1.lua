-----------------------------------------
-- ID: 4447
-- Item: pumpkin_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 45
-- Intelligence 4
-- Charisma -1
-- MP Recovered While Healing 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4447);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 45);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_CHR, -1);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 45);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_CHR, -1);
    target:delMod(MOD_MPHEAL, 1);
end;
