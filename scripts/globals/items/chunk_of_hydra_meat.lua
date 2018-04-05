-----------------------------------------
-- ID: 5564
-- Item: Chunk of Hydra Meat
-- Effect: 5 Minutes, food effect, Galka Only
-----------------------------------------
-- HP 10
-- MP -10
-- Strength +6
-- Intelligence -8
-- Demon Killer 10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 8) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_MEAT) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,5564);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_MP, -10);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_INT, -8);
    target:addMod(MOD_DEMON_KILLER, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_MP, -10);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_INT, -8);
    target:delMod(MOD_DEMON_KILLER, 10);
end;