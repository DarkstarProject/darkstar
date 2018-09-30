-----------------------------------------
-- Spell: Massacre Elegy
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 240
    local power = 10000

    local pCHR = caster:getStat(dsp.mod.CHR)
    local mCHR = target:getStat(dsp.mod.CHR)
    local dCHR = pCHR - mCHR
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.CHR
    params.skillType = dsp.skill.SINGING
    params.bonus = 0
    params.effect = dsp.effect.ELEGY
    resm = applyResistanceEffect(caster, target, spell, params)

    if resm < 0.5 then
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST) -- resist message
    else
        local iBoost = caster:getMod(dsp.mod.ELEGY_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
        power = power + iBoost * 100

        if caster:hasStatusEffect(dsp.effect.SOUL_VOICE) then
            power = power * 2
        elseif caster:hasStatusEffect(dsp.effect.MARCATO) then
            power = power * 1.5
        end
        caster:delStatusEffect(dsp.effect.MARCATO)

        duration = duration * (iBoost * 0.1 + caster:getMod(dsp.mod.SONG_DURATION_BONUS) / 100 + 1)

        if caster:hasStatusEffect(dsp.effect.TROUBADOUR) then
            duration = duration * 2
        end

        -- Try to overwrite weaker elegy
        if target:addStatusEffect(dsp.effect.ELEGY, power, 0, duration) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT) -- no effect
        end

    end

    return dsp.effect.ELEGY
end
