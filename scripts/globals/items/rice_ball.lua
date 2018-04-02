-----------------------------------------
-- ID: 4405
-- Item: Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 10,
-- Vit +2
-- Dex -1
-- hHP +1
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Def +50
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4405);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 10);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_DEX, -1);
    target:addMod(MOD_HPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 10);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_DEX, -1);
    target:delMod(MOD_HPHEAL, 1);
end;