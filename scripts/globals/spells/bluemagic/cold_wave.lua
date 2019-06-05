-----------------------------------------
-- Spell: Cold Wave
-- Deals ice damage that lowers Agility and gradually reduces HP of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 1
-- Stat Bonus: INT-1
-- Level: 52
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = dsp.effect.FROST
    local dINT = caster:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT)
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = nil
    local resist = applyResistance(caster, target, spell, params)

    if (target:getStatusEffect(dsp.effect.BURN) ~= nil) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
    elseif (resist > 0.5) then
        if (target:getStatusEffect(dsp.effect.CHOKE) ~= nil) then
            target:delStatusEffect(dsp.effect.CHOKE)
        end
        local sINT = caster:getStat(dsp.mod.INT)
        local DOT = getElementalDebuffDOT(sINT)
        local effect = target:getStatusEffect(typeEffect)
        local noeffect = false
        if (effect ~= nil) then
            if (effect:getPower() >= DOT) then
                noeffect = true
            end
        end
        if (noeffect) then
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
        else
            if (effect ~= nil) then
                target:delStatusEffect(typeEffect)
            end
                spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
            local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist)
            target:addStatusEffect(typeEffect,DOT,3,ELEMENTAL_DEBUFF_DURATION)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end
