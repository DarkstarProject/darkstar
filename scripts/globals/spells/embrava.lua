--------------------------------------
-- Spell: Embrava
--     Consumes 20% of your maximum MP. Gradually restores
--  target party member's HP and MP and increases attack speed.
--------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
--------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    -- If Tabula Rasa wears before spell goes off, no Embrava for you!
    if not caster:hasStatusEffect(dsp.effect.TABULA_RASA) then
        spell:setMsg(dsp.msg.basic.MAGIC_CANNOT_CAST)
        return 0
    end

    -- Skill caps at 500
    local skill = math.min(caster:getSkillLevel(dsp.skill.ENHANCING_MAGIC), 500)
    local duration = calculateDuration(90, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 5, target:getMainLvl())

    target:addStatusEffect(dsp.effect.EMBRAVA, skill, 0, duration)

    return dsp.effect.EMBRAVA
end