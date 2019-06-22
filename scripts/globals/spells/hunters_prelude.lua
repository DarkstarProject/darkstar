-----------------------------------------
-- Spell: Hunter's Prelude
-- Enhances ranged attack for party members within area of effect.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(dsp.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(dsp.slot.RANGED)

    local power = 10

    if sLvl+iLvl > 85 then
        power = power + math.floor((sLvl+iLvl - 85) / 18)
    end

    if (power >= 60) then
        power = 60
    end

    local iBoost = caster:getMod(dsp.mod.PRELUDE_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
        power = power + iBoost*4.5
    end


    if caster:hasStatusEffect(dsp.effect.SOUL_VOICE) then
        power = power * 2
    elseif caster:hasStatusEffect(dsp.effect.MARCATO) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS) / 100) + 1)

    if caster:hasStatusEffect(dsp.effect.TROUBADOUR) then
        duration = duration * 2
    end

    if not target:addBardSong(caster, dsp.effect.PRELUDE, power, 0, duration, caster:getID(), 0, 1) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.PRELUDE
end
