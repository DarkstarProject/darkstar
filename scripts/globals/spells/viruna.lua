-----------------------------------------
-- Spell: Viruna
-- Removes disease or plague from target.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (target:delStatusEffect(dsp.effect.DISEASE)) then
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
        return dsp.effect.DISEASE
    elseif (target:delStatusEffect(dsp.effect.PLAGUE)) then
        spell:setMsg(dsp.msg.basic.MAGIC_REMOVE_EFFECT)
        return dsp.effect.PLAGUE
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return 0
end
