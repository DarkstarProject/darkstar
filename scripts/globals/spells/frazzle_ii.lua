-----------------------------------------
-- Spell: Frazzle II
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local dMND = (caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND))
    local power = utils.clamp(40+math.floor(dMND/5), 40, 50)
    local duration = 120
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.MND
    params.skillType = power
    params.bonus = 0
    params.effect = dsp.effect.MAGIC_EVASION_DOWN
    duration = duration * applyResistanceEffect(caster, target, spell, params)

    if (duration >= 60) then
        if (target:addStatusEffect(dsp.effect.MAGIC_EVASION_DOWN,power,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return dsp.effect.MAGIC_EVASION_DOWN
end
