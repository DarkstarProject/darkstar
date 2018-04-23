-----------------------------------------
-- Spell: Utsusemi: San
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
    local numShadows = 5 + target:getMod(MOD_UTSUSEMI_BONUS);
    
    if (effect == nil or effect:getPower() <= 3) then
        target:addStatusEffectEx(dsp.effects.COPY_IMAGE, dsp.effects.COPY_IMAGE_4, numShadows, 0, 900, 0, numShadows);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end
    
    return dsp.effects.COPY_IMAGE;
end;
