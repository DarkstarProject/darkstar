-----------------------------------------
-- ID: 4446
-- Item: pumpkin_pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 40
-- Agility -1
-- Intelligence 3
-- Charisma -2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4446);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 40);
    target:addMod(MOD_AGI, -1);
    target:addMod(MOD_INT, 3);
    target:addMod(MOD_CHR, -2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 40);
    target:delMod(MOD_AGI, -1);
    target:delMod(MOD_INT, 3);
    target:delMod(MOD_CHR, -2);
end;
