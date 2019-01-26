-----------------------------------------
-- Spell: Aquaveil
-- Reduces chance of having a spell interrupted.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    target:delStatusEffect(dsp.effect.AQUAVEIL)

    -- duration is said to be based on enhancing skill with max 5 minutes, but I could find no
    -- tests that quantify the relationship so I'm using 5 minutes for now.
    local duration = calculateDuration(300, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    
    local power = AQUAVEIL_COUNTER + caster:getMod(dsp.mod.AQUAVEIL_COUNT)
    if caster:getSkillLevel(dsp.skill.ENHANCING_MAGIC) >= 200 then -- cutoff point is estimated. https://www.bg-wiki.com/bg/Aquaveil
        power = power + 1
    end
    
    power = math.max(power, 1) -- this shouldn't happen but it's probably best to prevent someone from accidentally underflowing the counter...

    target:addStatusEffect(dsp.effect.AQUAVEIL, power, 0, duration)
    spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)

    return dsp.effect.AQUAVEIL
end
