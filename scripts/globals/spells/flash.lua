-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
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
    local dINT = (caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND))

    local params = {}

    params.diff = nil

    params.attribute = dsp.mod.INT

    params.skillType = dsp.skill.DIVINE_MAGIC

    params.bonus =  150

    params.effect = nil

    local resist = applyResistance(caster, target, spell, params)
    local duration = 12 * resist

    if (resist > 0.0625) then
        if (target:addStatusEffect(dsp.effect.FLASH,200,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end
    return dsp.effect.FLASH
end
