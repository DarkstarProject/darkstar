-----------------------------------------
-- Spell: Curse
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    -- Pull base stats.
    dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))

    power = 50

    -- Duration, including resistance.  Unconfirmed.
    duration = 300
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.INT
    params.skillType = 35
    params.bonus = 0
    params.effect = dsp.effect.CURSE_I
    duration = duration * applyResistanceEffect(caster, target, spell, params)

    if (duration >= 150) then --Do it!
        if (target:addStatusEffect(dsp.effect.CURSE_I,power,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return dsp.effect.CURSE_I
end
