-----------------------------------------
-- Spell: Blank Gaze
-- Removes one beneficial magic effect from an enemy
-- Spell cost: 25 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 2
-- Stat Bonus: None
-- Level: 38
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
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
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))
    local params = {}
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.BLUE_MAGIC

    local resist = applyResistance(caster, target, spell, params)
    local effect = dsp.effect.NONE

    if (resist > 0.0625) then
        if (target:isFacing(caster)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ERASE)
            effect = target:dispelStatusEffect()
            if (effect == dsp.effect.NONE) then
                spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
            end
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return effect
end
