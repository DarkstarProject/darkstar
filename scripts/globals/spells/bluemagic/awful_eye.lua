-----------------------------------------
-- Spell: Awful Eye
-- Lowers Strength of enemies within a fan-shaped area originating from the caster
-- Spell cost: 32 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 46
-- Casting Time: 2.5 seconds
-- Recast Time: 60 seconds
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

    if (target:hasStatusEffect(dsp.effect.STR_DOWN)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    elseif (target:isFacing(caster)) then
        local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = dsp.mod.INT
        params.skillType = dsp.skill.BLUE_MAGIC
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
        if (resist <= 0) then
            spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_ERASE)
            target:addStatusEffect(dsp.effect.STR_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK) -- target loses STR
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.STR_DOWN
end
