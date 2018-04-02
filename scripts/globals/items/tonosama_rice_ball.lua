-----------------------------------------
-- ID: 4277
-- Item: Tonosama Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +15
-- Dex +3
-- Vit +3
-- Chr +3
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +50
-- Def +30
-- Double Attack +1%
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4277);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 15);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_CHR, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 15);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_CHR, 3);
end;