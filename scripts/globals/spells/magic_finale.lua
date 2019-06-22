-----------------------------------------
-- Spell: Magic Finale
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
    -- Pull base stats.
    local dCHR = (caster:getStat(dsp.mod.CHR) - target:getStat(dsp.mod.CHR))

    local params = {}

    params.diff = nil

    params.attribute = dsp.mod.CHR

    params.skillType = dsp.skill.SINGING

    params.bonus = caster:getMod(dsp.mod.FINALE_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)

    params.effect = nil

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
