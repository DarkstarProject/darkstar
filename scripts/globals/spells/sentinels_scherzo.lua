-----------------------------------------
-- Spell: Sentinel's Scherzo
-- Mitigates the impact of severely damaging attacks for party members within an area of effect.
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

    local power = math.floor((sLvl+iLvl-350) / 10)

    if (power >= 45) then
        power = 45
    end

    local iBoost = caster:getMod(dsp.mod.SCHERZO_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    power = power + iBoost

    local duration = 120

    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        duration = duration * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        duration = duration * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.SCHERZO,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.SCHERZO
end
