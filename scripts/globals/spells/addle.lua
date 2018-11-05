-----------------------------------------
-- Spell: Addle
-- Increases the casting time of the target
-- Exact formula is unknown.
--
-- Raw Value is said to be 30%
-- It is said to increase to 50% w/ Saboteur
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dMND = caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)

    local power = calculatePotency(30, dMND, spell:getSkillType(), caster, target)

    -- Sub Power: Magic Accuracy Modifier
    -- Magic Accuracy penalty = floor(dMND/5)+20
    -- Caps at -40 magic accuracy
    local subPower = math.min(math.floor(dMND / 5) + 20, 40)

    --Duration, including resistance.
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dMND
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.ADDLE
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then -- Do it!
        if target:addStatusEffect(params.effect, power, 0, duration * resist, 0, subPower) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end
