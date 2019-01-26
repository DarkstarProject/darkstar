-----------------------------------------
-- Spell: Poison
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)

    local skill = caster:getSkillLevel(dsp.skill.ENFEEBLING_MAGIC)
    local power = math.max(skill / 20, 4)
    if skill > 400 then
        power = math.floor(skill * 49 / 183 - 55) -- No cap can be reached yet
    end
    power = calculatePotency(power, spell:getSkillType(), caster, target)

    local duration = calculateDuration(120, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.POISON
    local resist = applyResistanceEffect(caster, target, spell, params)
    
    if resist >= 0.5 then -- effect taken
        if target:addStatusEffect(params.effect, power, 3, duration * resist) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else -- resist entirely.
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end