-----------------------------------------
-- Spell: Slow
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- Slow's potency is calculated with the formula (187.5 + dMND*1.5)/1024, and caps at 300/1024 (~29.3%).
-- And MND of 75 is neccessary to reach the hardcap of Slow.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local dMND = caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)

    --Power
    local power = 1500
    if dMND > 0 then
        power = power + dMND * 20
    else
        power = power + dMND * 10
    end
    power = utils.clamp(power, 730, 2929) -- Lowest 75/1024, Highest 300/1024 ~7.3%-29.2%

    if caster:hasStatusEffect(dsp.effect.SABOTEUR) then
        power = power * 2
    end

    --Duration, including resistance

    --Duration, including resistance.
    local duration = 120
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.MND
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.SLOW
    duration = duration * applyResistanceEffect(caster, target, spell, params)
    if duration >= 60 then --Do it!

        if caster:hasStatusEffect(dsp.effect.SABOTEUR) then
            duration = duration * 2
        end
        caster:delStatusEffect(dsp.effect.SABOTEUR)

        if target:addStatusEffect(dsp.effect.SLOW, power, 0, duration, 0, 1) then
    caster:delStatusEffect(dsp.effect.SABOTEUR)
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return dsp.effect.SLOW
end
