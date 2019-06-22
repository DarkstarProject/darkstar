-----------------------------------------
-- Spell: Dokumori: Ni
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local effect = dsp.effect.POISON
    -- Base Stats
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))
    --Duration Calculation
    local duration = 120
    local params = {}
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.NINJUTSU
    params.bonus = 0
    duration = duration * applyResistance(caster, target, spell, params)
    local power = 10

    --Calculates resist chanve from Reist Blind
    if (target:hasStatusEffect(effect)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
        return effect
    end

    if (math.random(0,100) >= target:getMod(dsp.mod.POISONRES)) then
        if (duration >= 60) then
            if (target:addStatusEffect(effect,power,3,duration)) then
                spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
            else
                spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
            end
        else
            spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST_2)
    end
    return effect
end
