-----------------------------------------
-- Spell: Victory March
-- Gives party members Haste
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

    local power = 43

    if (sLvl+iLvl > 300) then
        power = power + math.floor((sLvl+iLvl-300) / 7)
    end

    if (power >= 163) then
        power = 163
    end

    local iBoost = caster:getMod(dsp.mod.MARCH_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    power = power + iBoost*16

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    -- convert to new haste system
    power = (power / 1024) * 10000

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.MARCH,power,0,duration,caster:getID(), 0, 2)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.MARCH
end
