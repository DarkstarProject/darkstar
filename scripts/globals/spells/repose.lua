-----------------------------------------
-- Spell: Repose
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
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.MND
    params.skillType = dsp.skill.DIVINE_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.SLEEP_II
    local resist = applyResistanceEffect(caster, target, spell, params)
    if (resist < 0.5) then
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST) -- Resist
        return dsp.effect.SLEEP_II
    end

    if (target:addStatusEffect(dsp.effect.SLEEP_II,2,0,90*resist)) then
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- No effect
    end

    return dsp.effect.SLEEP_II
end
