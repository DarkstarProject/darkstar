-----------------------------------------
-- Spell: Slow
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- Slow's potency is calculated with the formula (187.5 + dMND*1.5)/1024, and caps at 300/1024 (~29.3%).
-- And MND of 75 is neccessary to reach the hardcap of Slow.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local dMND = caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)

    -- FIXME: PRETTY SURE THIS IS ALL WRONG
    --Power
    local power = 1500
    if dMND > 0 then
        power = power + dMND * 20
    else
        power = power + dMND * 10
    end
    power = utils.clamp(power, 730, 2929) -- Lowest 75/1024, Highest 300/1024 ~7.3%-29.2%
    power = calculatePotency(power, dMND, spell:getSkillType(), caster, target)

    --Duration, including resistance
    local duration = calculateDuration(120, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local params = {}
    params.diff = dMND
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.SLOW
    local resist = applyResistanceEffect(caster, target, spell, params)
    
    if resist >= 0.5 then -- Do it!
        if target:addStatusEffect(params.effect, power, 0, duration * resist, 0, 1) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end

    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end