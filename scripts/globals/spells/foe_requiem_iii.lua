-----------------------------------------
-- Spell: Foe Requiem III
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local effect = dsp.effect.REQUIEM
    local duration = 95
    local power = 3

    local pCHR = caster:getStat(dsp.mod.CHR)
    local mCHR = target:getStat(dsp.mod.CHR)
    local dCHR = (pCHR - mCHR)
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.CHR
    params.skillType = dsp.skill.SINGING
    params.bonus = 0
    params.effect = nil
    resm = applyResistance(caster, target, spell, params)
    if (resm < 0.5) then
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST) -- resist message
        return 1
    end

    local iBoost = caster:getMod(dsp.mod.REQUIEM_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    power = power + iBoost

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end
    -- Try to overwrite weaker slow / haste
    if (canOverwrite(target, effect, power)) then
        -- overwrite them
        target:delStatusEffect(effect)
        target:addStatusEffect(effect,power,3,duration)
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return effect
end
