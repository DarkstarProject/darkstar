-----------------------------------------
-- Spell: Jubaku: San
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and INT.
-- taken from paralyze
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local effect = dsp.effect.PARALYSIS
    -- Base Stats
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))
    --Duration Calculation
    local duration = 420
    local params = {}
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.NINJUTSU
    params.bonus = 0
    duration = duration * applyResistance(caster, target, spell, params)
    --Paralyze base power is 35 and is not affected by resistaces.
    local power = 35

    --Calculates resist chanve from Reist Blind
    if (math.random(0,100) >= target:getMod(dsp.mod.PARALYZERES)) then
        if (duration >= 210) then
            -- Erases a weaker blind and applies the stronger one
            local paralysis = target:getStatusEffect(effect)
            if (paralysis ~= nil) then
                if (paralysis:getPower() < power) then
                    target:delStatusEffect(effect)
                    target:addStatusEffect(effect,power,0,duration)
                    spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
                else
                    spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
                end
            else
                target:addStatusEffect(effect,power,0,duration)
                spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
            end
        else
            spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST_2)
    end
    return effect
end
