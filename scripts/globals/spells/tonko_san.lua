-----------------------------------------
-- Spell: Tonko: san
-- Lessens chance of being detected by sound
-- Duration is 7 minutes (non-random duration)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(dsp.effect.INVISIBLE) == false) then
        target:addStatusEffect(dsp.effect.INVISIBLE,0,10,420)
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no dsp.effect.
    end
    return dsp.effect.INVISIBLE
end
