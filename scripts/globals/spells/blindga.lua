-----------------------------------------
-- Spell: Blind
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
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.MND)) --blind uses caster INT vs target MND

    -- Base power.  May need more research.
    local power = math.floor(dINT * 9/40) + 23

    if (power < 5) then
        power = 5
    end

    if (power > 50) then
        power = 50
    end


    -- Duration, including resistance.  Unconfirmed.
    local duration = 180
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.INT
    params.skillType = 35
    params.bonus = 0
    params.effect = dsp.effect.BLINDNESS
    duration = duration * applyResistanceEffect(caster, target, spell, params)

    if (duration >= 60) then --Do it!

        if (target:addStatusEffect(dsp.effect.BLINDNESS,power,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end
    return dsp.effect.BLINDNESS
end
