-----------------------------------------
-- Spell: Regen II
-- Gradually restores target's HP.
-----------------------------------------
-- Scale down duration based on level
-- Composure increases duration 3x
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local hp = math.ceil(12 * (1 + 0.01 * caster:getMod(dsp.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(dsp.merit.REGEN_EFFECT) -- bonus hp from merits
    hp = hp + caster:getMod(dsp.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts

    local duration = 60

    duration = duration + caster:getMod(dsp.mod.REGEN_DURATION)

    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3
    end

    duration = calculateDurationForLvl(duration, 44, target:getMainLvl())

    if (target:hasStatusEffect(dsp.effect.REGEN) and target:getStatusEffect(dsp.effect.REGEN):getTier() == 1) then
        target:delStatusEffect(dsp.effect.REGEN)
    end

    if (target:addStatusEffect(dsp.effect.REGEN,hp,3,duration,0,0,0)) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return dsp.effect.REGEN
end
