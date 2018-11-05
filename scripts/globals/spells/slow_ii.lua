-----------------------------------------
-- Spell: Slow II
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- caster:getMerit() returns a value which is equal to the number of merit points TIMES the value of each point
-- Slow II value per point is '1' This is a constant set in the table 'merits'
-----------------------------------------
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
    local power = utils.clamp(base + dMND * 1160/75, 1250, 3906) -- Lowest 128/1024 ~12.5%, Highest 400/1024 ~39.06%
    power = calculatePotency(power, dMND, spell:getSkillType(), caster, target)

    --Duration, including resistance.
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dMND
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = merits * 2
    params.effect = dsp.effect.SLOW
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then --Do it!
        if target:addStatusEffect(params.effect, power, 0, duration * resist) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end

    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end