-----------------------------------------
-- Spell: Utsusemi: San
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local effect = target:getStatusEffect(dsp.effect.COPY_IMAGE)
    
    -- Get extras shadows
    local numShadows = 5 + target:getMod(dsp.mod.UTSUSEMI_BONUS)
    
    if (effect == nil or effect:getPower() <= 3) then
        target:addStatusEffectEx(dsp.effect.COPY_IMAGE, dsp.effect.COPY_IMAGE_4, numShadows, 0, 900, 0, numShadows)
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end
    
    return dsp.effect.COPY_IMAGE
end
