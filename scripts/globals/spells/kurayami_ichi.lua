-----------------------------------------
-- Spell: Kurayami:Ichi
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    -- Base Stats
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))
    --Duration Calculation
    local duration = 180
    local params = {}
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.NINJUTSU
    params.bonus = 0
    duration = duration * applyResistance(caster, target, spell, params)
    --Kurayami base power is 20 and is not affected by resistaces.
    local power = 20

    --Calculates resist chance from Reist Blind
    if (math.random(0,100) >= target:getMod(dsp.mod.BLINDRES)) then
        if (duration >= 80) then

            if (target:addStatusEffect(dsp.effect.BLINDNESS,power,0,duration)) then
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
    return dsp.effect.BLINDNESS
end
