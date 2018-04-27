-----------------------------------------
-- Spell: Utsusemi: Ichi
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = target:getStatusEffect(dsp.effects.COPY_IMAGE);

    -- Get extras shadows
    local numShadows = 3 + target:getMod(MOD_UTSUSEMI_BONUS);
    local icon = dsp.effects.COPY_IMAGE_3;
    if (numShadows > 3) then
        icon = dsp.effects.COPY_IMAGE_4;
    end
    
    if (effect == nil or effect:getPower() <= 1) then
        target:addStatusEffectEx(dsp.effects.COPY_IMAGE, icon, 1, 0, 900, 0, numShadows);
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.COPY_IMAGE;
end;
