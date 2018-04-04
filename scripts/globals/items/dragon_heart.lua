-----------------------------------------
-- ID: 4486
-- Item: Dragon Heart
-- Food Effect: 3 Hr, Galka Only
-----------------------------------------
-- Strength 7
-- Intelligence -9
-- MP -40
-- HP 40
-- Dragon Killer 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4486);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 7);
    target:addMod(MOD_INT, -9);
    target:addMod(MOD_MP, -40);
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_DRAGON_KILLER, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 7);
    target:delMod(MOD_INT, -9);
    target:delMod(MOD_MP, -40);
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_DRAGON_KILLER, 10);
end;
