-----------------------------------------
-- Spell: Dispelga
--
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    local resist = applyResistance(caster, target, spell, params)
    local effect = dsp.effect.NONE

    if (resist > 0.0625) then
        spell:setMsg(dsp.msg.basic.MAGIC_ERASE)
        effect = target:dispelStatusEffect()
        if (effect == dsp.effect.NONE) then
            -- no effect
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return effect
end
