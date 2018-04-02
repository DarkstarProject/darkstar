-----------------------------------------
-- ID: 5929
-- Item: Ojo Rice Ball
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- HP +50
-- Dexterity +5
-- Vitality +5
-- Character +5
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Attack +60
-- Defense +40
-- Triple Attack +2%
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5929);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 50);
    target:addMod(MOD_DEX, 5);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_CHR, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 50);
    target:delMod(MOD_DEX, 5);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_CHR, 5);
end;