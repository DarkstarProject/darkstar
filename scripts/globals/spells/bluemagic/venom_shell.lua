-----------------------------------------
-- Spell: Venom Shell
-- Poisons enemies within range and gradually reduces their HP
-- Spell cost: 86 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: MND+2
-- Level: 42
-- Casting Time: 3 seconds
-- Recast Time: 45 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = dsp.effect.POISON
    local dINT = caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = typeEffect
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 180 * resist
    local power = 6

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect,power,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end
