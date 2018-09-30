-----------------------------------------
-- Spell: Distract
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
    local dMND = (caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND))

    -- Base power.  May need more research.
    local power = 35

    -- Duration, including resistance.  Unconfirmed.
    local duration = 120
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.MND
    params.skillType = 35
    params.bonus = 0
    params.effect = dsp.effect.EVASION_DOWN
    duration = duration * applyResistanceEffect(caster, target, spell, params)

    if (duration >= 60) then -- Do it!
        if (target:addStatusEffect(dsp.effect.EVASION_DOWN,power,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return dsp.effect.EVASION_DOWN
end
