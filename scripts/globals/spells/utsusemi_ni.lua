-----------------------------------------
-- Spell: Utsusemi: Ni
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
    local numShadows = 3
    local icon = dsp.effect.COPY_IMAGE_3
    
    if (caster:getMainJob() == dsp.job.NIN) then
        numShadows = 4 + target:getMod(dsp.mod.UTSUSEMI_BONUS)
        icon = dsp.effect.COPY_IMAGE_4
    end
    
    if (effect == nil or effect:getPower() <= 2) then
        target:addStatusEffectEx(dsp.effect.COPY_IMAGE, icon, 2, 0, 900, 0, numShadows)
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.COPY_IMAGE
end
