-----------------------------------------
-- ID: 5928
-- Item: Himesama Rice Ball
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- HP +25
-- Dexterity +4
-- Vitality +4
-- Character +4
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Attack +60
-- Defense +40
-- Triple Attack +1%
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5928);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_CHR, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_CHR, 4);
end;