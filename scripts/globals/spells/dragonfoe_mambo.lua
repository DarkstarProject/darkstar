-----------------------------------------
-- Spell: Dragonfoe Mambo
-- Grants evasion bonus to all members.
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

    -- Since nobody knows the evasion values for mambo, I'll just make shit up! (aka - same as madrigal)
    local power = 9

    if (sLvl+iLvl > 130) then
        power = power + math.floor((sLvl+iLvl-130) / 18)
    end

    if (power >= 48) then
        power = 48
    end

    local iBoost = caster:getMod(dsp.mod.MAMBO_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
        power = power + iBoost*7
    end

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.MAMBO,power,0,duration,caster:getID(), 0, 2)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.MAMBO
end
