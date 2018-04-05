-----------------------------------------
-- ID: 4488
-- Item: jack-o-lantern
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Charisma -10
-- Accuracy 10
-- Ranged Acc 10
-- Evasion 10
-- Arcana Killer 4
-- Dark Res 25
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4488);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_CHR, -10);
    target:addMod(MOD_ACC, 10);
    target:addMod(MOD_RACC, 10);
    target:addMod(MOD_EVA, 10);
    target:addMod(MOD_ARCANA_KILLER, 4);
    target:addMod(MOD_DARKRES, 25);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_ACC, 10);
    target:delMod(MOD_RACC, 10);
    target:delMod(MOD_EVA, 10);
    target:delMod(MOD_ARCANA_KILLER, 4);
    target:delMod(MOD_DARKRES, 25);
end;
