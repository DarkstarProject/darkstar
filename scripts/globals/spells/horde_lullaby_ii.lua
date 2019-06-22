-----------------------------------------
-- Spell: Horde Lullaby II
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local duration = 30
    local pCHR = caster:getStat(dsp.mod.CHR)
    local mCHR = target:getStat(dsp.mod.CHR)
    local dCHR = pCHR - mCHR
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.CHR
    params.skillType = dsp.skill.SINGING
    params.bonus = 0
    params.effect = dsp.effect.LULLABY
    resm = applyResistanceEffect(caster, target, spell, params)

    if resm < 0.5 then
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST) -- resist message
    else
        local iBoost = caster:getMod(dsp.mod.LULLABY_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)

        duration = duration * (iBoost * 0.1 + caster:getMod(dsp.mod.SONG_DURATION_BONUS) / 100 + 1)

        if caster:hasStatusEffect(dsp.effect.TROUBADOUR) then
            duration = duration * 2
        end

        if target:addStatusEffect(dsp.effect.LULLABY, 1, 0, duration) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    end

    return dsp.effect.LULLABY
end
