-----------------------------------------
-- Spell: Tonko: ni
-- Lessens chance of being detected by sound
-- Duration is 5 minutes (non-random duration)
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(dsp.effect.INVISIBLE) == false) then
        target:addStatusEffect(dsp.effect.INVISIBLE, 0, 10, math.floor(600 * SNEAK_INVIS_DURATION_MULTIPLIER))
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no dsp.effect.
    end

    return dsp.effect.INVISIBLE
end
