-----------------------------------------
-- Spell: Addle
-- Increases the casting time of the target
-- Exact formula is unknown.
--
-- Raw Value is said to be 30%
-- It is said to increase to 50% w/ Saboteur
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

    -- Power: Cast Time Modifier
    local power = 30

    if (caster:hasStatusEffect(dsp.effect.SABOTEUR)) then
        power = 50
    end

    -- Sub Power: Magic Accuracy Modifier
    local targetMagicAccuracy = target:getMod(dsp.mod.MACC)
    local subPower = math.floor( targetMagicAccuracy * (power / 100) )

    --Duration, including resistance.
    local duration = 180
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.MND
    params.skillType = 35
    params.bonus = 0
    params.effect = dsp.effect.ADDLE
    duration = duration * applyResistanceEffect(caster, target, spell, params)

    if (duration >= 60) then -- Do it!
        if (caster:hasStatusEffect(dsp.effect.SABOTEUR)) then
            duration = duration * 2
            caster:delStatusEffect(dsp.effect.SABOTEUR)
        end

        if (target:addStatusEffect(dsp.effect.ADDLE, power, 0, duration, 0, subPower)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return dsp.effect.ADDLE
end
