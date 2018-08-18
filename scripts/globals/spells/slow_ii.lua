-----------------------------------------
-- Spell: Slow II
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Slow II value per point is '1' This is a constant set in the table 'merits'
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

function onSpellCast(caster, target, spell)
    local dMND = caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)
    local merits = caster:getMerit(dsp.merit.SLOW_II)

    local base = 2440 + merits * 100
    local potency = utils.clamp(base + dMND * 1160/75, 1250, 3906) -- Lowest 128/1024 ~12.5%, Highest 400/1024 ~39.06%

    if caster:hasStatusEffect(dsp.effect.SABOTEUR) then
        potency = potency * 2
    end

    --Duration, including resistance

    if (merits > 1) then
        potency = potency + ((merits - 1) * 10)
    end

    if (caster:hasStatusEffect(dsp.effect.SABOTEUR)) then
        potency = potency * 2
    end

    --Duration, including resistance.
    local duration = 180
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.MND
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = merits * 2
    params.effect = dsp.effect.SLOW
    duration = duration * applyResistanceEffect(caster, target, spell, params)

    if duration >= 60 then --Do it!
        if caster:hasStatusEffect(dsp.effect.SABOTEUR) then
            duration = duration * 2
        end
        caster:delStatusEffect(dsp.effect.SABOTEUR)

        if target:addStatusEffect(dsp.effect.SLOW, potency, 0, duration) then
        duration = duration * 2
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
